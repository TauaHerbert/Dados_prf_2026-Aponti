import pandas as pd
from dados import agricultores

# Convertendo a lista de dicionários em um DataFrame do Pandas
df_agricultores = pd.DataFrame(agricultores)

print("=" * 70)
print(" 🌾 SISTEMA DE INTELIGÊNCIA - AGRICULTURA FAMILIAR (ODS 8) 🌾")
print("=" * 70)

# BASE DE DADOS INICIAL
print("\n[BASE DE DADOS] Agricultores em Análise:")
print(df_agricultores[['nome', 'categoria', 'formalizado', 'faturamento_anual']].to_string(index=False))
print("-" * 70)


# Usar conjuntos (set) para remover categorias duplicadas
print("\n[1] MAPEAMENTO DE PRODUÇÃO DA REGIÃO:")
categorias_unicas = set(df_agricultores['categoria'].tolist())

print("Categorias únicas cultivadas na região:")
for categoria in categorias_unicas:
    print(f" ✔ {categoria}")

# Calcular o faturamento médio via Pandas (POR CATEGORIA)
print("\n[2] TERMÔMETRO FINANCEIRO (Por Categoria e Regional):")

# Agrupando e calculando a média de cada categoria separadamente
print(" ➔ Faturamento Médio Anual por Categoria:")
media_por_categoria = df_agricultores.groupby('categoria')['faturamento_anual'].mean()

for categoria, valor in media_por_categoria.items():
    print(f"    - {categoria}: R$ {valor:.2f}")

# Média geral (Regional) necessária para a regra de crédito
faturamento_medio = df_agricultores['faturamento_anual'].mean()
print(f"\n ➔ Faturamento Médio Geral da Região: R$ {faturamento_medio:.2f}")

# Filtrar empresas elegíveis para crédito subsidiado
print("\n[3] ELEGIBILIDADE PARA CRÉDITO SUBSIDIADO:")
print(f"Regra: Ser formalizado (True) E faturar ABAIXO da média geral (R$ {faturamento_medio:.2f})")

# O filtro do Pandas (Regra de Negócio)
agricultores_elegiveis = df_agricultores[
    (df_agricultores['formalizado'] == True) &
    (df_agricultores['faturamento_anual'] < faturamento_medio)
    ]

# QUADRO E EXPORTAÇÃO JSON
if not agricultores_elegiveis.empty:
    print("\n" + "=" * 70)
    print(" 🏆 QUADRO FINAL: AGRICULTORES APROVADOS PARA CRÉDITO ")
    print("=" * 70)

    # Exibe um quadro limpo só com os aprovados
    print(agricultores_elegiveis[['nome', 'responsavel', 'categoria', 'faturamento_anual']].to_string(index=False))
    print("=" * 70)

    # Exportando para JSON na sua pasta
    nome_arquivo = "relatorios_gerados/aprovados_credito.json"
    agricultores_elegiveis.to_json(nome_arquivo, orient="records", force_ascii=False, indent=4)

    print(f"\n✅ SUCESSO: Os dados dos aprovados foram exportados para '{nome_arquivo}'!")
else:
    print("\nNenhum agricultor se enquadrou nas regras de crédito no momento.")

print("\n" + "=" * 70)