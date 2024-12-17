# Análise dos Pinguins de Palmer

## Visão Geral
Este projeto tem como foco a análise do conjunto de dados **Palmer Penguins** utilizando a linguagem de programação **R** e as bibliotecas do pacote **tidyverse**. O objetivo é realizar uma análise exploratória dos dados (EDA), limpar e manipular o conjunto de dados, calcular resumos estatísticos e criar visualizações para entender padrões presentes nos dados.

## Objetivos
- Limpar e explorar o conjunto de dados dos pinguins de Palmer.
- Filtrar, ordenar e criar subconjuntos dos dados usando funções do **dplyr**.
- Realizar análises estatísticas para calcular a massa corporal média e identificar padrões por espécie e ilha.
- Criar visualizações para explorar relações entre variáveis usando **ggplot2**.

## Descrição do Conjunto de Dados
O conjunto de dados **Palmer Penguins** contém observações de três espécies de pinguins coletadas em ilhas do Arquipélago Palmer, na Antártida.

### Colunas:
1. **species**: Espécie do pinguim (Adelie, Chinstrap, Gentoo)
2. **island**: Nome da ilha (Torgersen, Biscoe, Dream)
3. **culmen_length_mm**: Comprimento do bico do pinguim (em mm)
4. **culmen_depth_mm**: Profundidade do bico do pinguim (em mm)
5. **flipper_length_mm**: Comprimento da nadadeira do pinguim (em mm)
6. **body_mass_g**: Massa corporal do pinguim (em gramas)
7. **sex**: Sexo do pinguim (Macho/Fêmea)

---

## Ferramentas e Bibliotecas
- **R**: Linguagem de programação para cálculos estatísticos.
- **tidyverse**: Conjunto de pacotes do R para manipulação e visualização de dados.
  - dplyr
  - ggplot2
  - readr

---

## Fluxo de Trabalho

### 1. Importação e Exploração dos Dados
- Carregar o conjunto de dados usando `read_csv`.
- Utilizar `glimpse()`, `summary()` e `head()` para uma inspeção inicial.

```r
library(tidyverse)
library(readr)
file_path <- "./penguins_size.csv"
penguins <- read_csv(file_path)

glimpse(penguins)
summary(penguins)
head(penguins)
```

### 2. Filtragem e Criação de Subconjuntos
Filtrar linhas específicas com base em condições:
```r
penguins %>% filter(island == "Torgersen")
```

Criar um subconjunto aleatório dos dados:
```r
set.seed(406)
penguins_subset <- penguins %>% sample_n(12)
penguins_subset
```

### 3. Criação de Novas Variáveis
Adicionar uma nova coluna para o peso corporal em libras:
```r
penguins_subset <- penguins_subset %>% 
  mutate(body_weight_pounds = body_mass_g / 453.59237)
```

### 4. Resumo dos Dados
Calcular a massa corporal média por espécie e ilha:
```r
penguins %>% group_by(species, island) %>% 
  summarise(avg_body_mass = mean(body_mass_g, na.rm = TRUE))
```

### 5. Visualizações
Criar gráficos de dispersão para comparar a massa corporal e o comprimento das nadadeiras entre as espécies:
```r
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(aes(color = species, shape = species)) + 
  facet_wrap(~species) + 
  labs(title = "Pinguins de Palmer: Massa Corporal vs. Comprimento da Nadadeira")
```

---

## Resultados
- **Análise das Espécies**: Foram observadas diferenças significativas na massa corporal e comprimento das nadadeiras entre as espécies.
- **Comparação entre Ilhas**: A massa corporal varia entre ilhas para a mesma espécie.
- **Visualizações**: Os gráficos de dispersão mostram distinções claras nas características entre as espécies.

---

## Próximos Passos
- Analisar correlações entre todas as variáveis numéricas.
- Construir modelos preditivos de massa corporal utilizando regressão linear.
- Investigar diferenças adicionais, como a comparação entre machos e fêmeas.

---

## Dependências
- R (versão 4.0+)
- tidyverse (dplyr, ggplot2, readr)

Para instalar as bibliotecas necessárias:
```r
install.packages("tidyverse")
```

---

## Autor
Christopher Barros

---

## Agradecimentos
- Palmer Station LTER e Environmental Data Initiative por disponibilizar o conjunto de dados.
- Equipe do **RStudio** e do **tidyverse** por suas ferramentas poderosas de análise de dados.