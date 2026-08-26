-- Tauã Herbert de Oliveira Nascimento
-- Módulo 3 - SQL com SQLite 
-- Projeto: Data Analytics com Dados Abertos da PRF 
-- Base: Acidentes 2025 agrupados por ocorrência 

-- Estrutura (colunas e tipos) da tabela importada 'acidentes_prf_2025' 
PRAGMA table_info(acidentes_prf_2025);
SELECT * from acidentes_prf_2025;

-- Total de registrtos de acidentes
SELECT COUNT(*) AS total_registros FROM acidentes_prf_2025;

--  Verificando se existe a view base no banco para evitar conflito e criando a view base com a flag 'acidente_fatal' (1 para mortos >= 1, senão 0)  
DROP VIEW IF EXISTS vw_acidentes_base;
CREATE VIEW vw_acidentes_base AS SELECT *, CASE
		WHEN CAST(mortos AS INTEGER) >= 1 THEN 1 ELSE 0 END AS acidente_fatal FROM acidentes_prf_2025;
SELECT * FROM vw_acidentes_base;

-- Analisando a quantidade de mortos e classificando o acidente_fatal
SELECT mortos, acidente_fatal from vw_acidentes_base;

-- Calcular métricas gerais: total de acidentes, total de fatais e o % de letalidade 
SELECT COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base;

-- Agregando acidentes, mortos e % de fatais por Estado (UF), filtrando os com ao menos 100 casos 
SELECT uf, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY uf HAVING COUNT(*) >= 100 ORDER BY total_acidentes DESC;

-- Listando as 30 rodovias (BRs) mais letais em número absoluto de mortos 
SELECT br, SUM(mortos) AS total_mortos FROM vw_acidentes_base GROUP BY br ORDER BY total_mortos DESC LIMIT 30;

-- Agrupando a evolução temporal dos acidentes por Ano e Mês (extraídos da data) 
SELECT strftime('%Y', data_inversa) AS ano, strftime('%m', data_inversa) AS mes, COUNT(*) AS total_acidentes FROM vw_acidentes_base GROUP BY ano, mes ORDER BY ano, mes;

--  Analisando a relação bivariada entre o Tipo de Acidente e o % de ocorrências fatais 
SELECT tipo_acidente, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY tipo_acidente ORDER BY percentual_letalidade DESC;

-- Analisando as 30 Principais Causas de Acidentes ordenadas pela maior taxa de letalidade
SELECT causa_acidente, COUNT(*) AS total_causa_acidente, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY causa_acidente ORDER BY percentual_letalidade DESC LIMIT 30;

-- Comparando a gravidade dos acidentes de acordo com a Fase do Dia (noite, pleno dia, etc.)
SELECT fase_dia, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY fase_dia ORDER BY percentual_letalidade DESC;

--  Avaliando a influência da Condição Meteorológica no % de acidentes fatais 
SELECT condicao_metereo, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY condicao_metereo ORDER BY percentual_letalidade DESC;

-- Comparando a letalidade do acidente de acordo com o Tipo de Pista (simples, dupla, múltipla)
SELECT tipo_pista, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS total_fatais, (SUM(acidente_fatal) * 100.0 / COUNT(*)) AS percentual_letalidade FROM vw_acidentes_base GROUP BY tipo_pista ORDER BY percentual_letalidade DESC;

-- Analisando a combinação de dois fatores (Pista + Fase do Dia) e a cobertura em relação ao total
SELECT tipo_pista, fase_dia, COUNT(*) AS total_na_combinacao, 
	(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM acidentes_prf_2025)) AS percentual_cobertura_total FROM acidentes_prf_2025 GROUP BY 
    		tipo_pista, fase_dia ORDER BY percentual_cobertura_total DESC;
            
-- Calculando o efeito 'Lift' (razão entre a taxa de letalidade do tipo e a taxa média geral) 
WITH global AS (SELECT 1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global FROM vw_acidentes_base)
	SELECT tipo_acidente AS categoria, COUNT(*) AS total_acidentes, SUM(CAST(mortos AS INTEGER)) AS total_mortos, SUM(acidente_fatal) AS acidentes_fatais, ROUND(100.0 * SUM(acidente_fatal)
		/ COUNT(*), 2) AS perc_fatais, ROUND((1.0 * SUM(acidente_fatal) / COUNT(*)) / taxa_global, 2) AS lift FROM vw_acidentes_base, global
				GROUP BY categoria, taxa_global HAVING COUNT(*) >= 100 ORDER BY lift DESC;

-- Criando a view 'vw_indicadores_mensais' para facilitar relatórios temporais
CREATE VIEW vw_indicadores_mensais AS SELECT strftime('%Y', data_inversa) AS ano, strftime('%m', data_inversa) AS mes, COUNT(*) AS total_acidentes, 
    SUM(CAST(mortos AS INTEGER)) AS total_mortos, SUM(acidente_fatal) AS acidentes_fatais, ROUND(100.0 * SUM(acidente_fatal) / COUNT(*), 2) AS perc_fatais FROM vw_acidentes_base 
		GROUP BY ano, mes ORDER BY ano, mes;
SELECT * from vw_indicadores_mensais;

-- Criando a view 'vw_indicadores_uf_br' consolidadas por localização para uso em Dashboards.
CREATE VIEW vw_indicadores_uf_br AS SELECT uf, br, COUNT(*) AS total_acidentes, SUM(CAST(mortos AS INTEGER)) AS total_mortos, SUM(acidente_fatal) AS acidentes_fatais, ROUND(100.0 * SUM(acidente_fatal)
	/ COUNT(*), 2) AS perc_fatais FROM vw_acidentes_base WHERE br IS NOT NULL GROUP BY uf, br;
SELECT * FROM vw_indicadores_uf_br;

-- View Bivariada por Tipo de Acidente
CREATE VIEW vw_bivariada_tipo_acidente AS WITH global AS (SELECT 1.0 * SUM(acidente_fatal) / COUNT(*) AS taxa_global FROM vw_acidentes_base)
	SELECT b.tipo_acidente AS categoria, COUNT(*) AS total_acidentes, SUM(b.acidente_fatal) AS acidentes_fatais, ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS cobertura_perc,
    	ROUND(100.0 * SUM(b.acidente_fatal) / COUNT(*), 2) AS perc_fatais, ROUND((1.0 * SUM(b.acidente_fatal) / COUNT(*)) / g.taxa_global, 2) AS lift FROM vw_acidentes_base b
			CROSS JOIN global g GROUP BY b.tipo_acidente, g.taxa_global HAVING COUNT(*) >= 100;
SELECT * FROM vw_bivariada_tipo_acidente;

-- Validação Cruzada de Totais
SELECT 'base' AS origem, COUNT(*) AS total, SUM(acidente_fatal) AS fatais FROM vw_acidentes_base
	UNION ALL
		SELECT 'soma_por_uf' AS origem, SUM(total_acidentes), SUM(acidentes_fatais) FROM ( SELECT uf, COUNT(*) AS total_acidentes, SUM(acidente_fatal) AS acidentes_fatais FROM vw_acidentes_base GROUP BY uf);






