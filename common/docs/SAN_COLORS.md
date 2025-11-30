# SANXZ Color Theory & Palette

Este documento define a identidade visual unificada **SANXZ**, aplicada em todo o ecossistema (Neovim, Shell, Window Manager, Browser).

## 1. Filosofia Base: Pureza e Vibração

A paleta foi construída para maximizar o contraste e a legibilidade em fundos escuros (Preto Absoluto `#000000`), utilizando cores com **100% de saturação** como base.

### A Regra das 16 Cores (ANSI Standard)
O sistema utiliza estritamente 16 cores, mapeadas para os slots padrão do terminal, mas com valores hexadecimais proprietários.

*   **7 Cores Base (Saturadas):** Representam o espectro puro (RGB/CMY). Usadas para elementos de fundo ou menor destaque.
*   **7 Cores Brilhantes (Luminosas):** Versões com maior luminosidade das bases. Usadas para texto principal e destaques.
*   **2 Neutros:** Preto e Branco puros.

## 2. A Paleta Pura (Source of Truth)

| Nome | Slot ANSI | Hex Base | Hex Brilhante |
| :--- | :--- | :--- | :--- |
| **Vermelho** | 1 / 9 | `#FF0000` | `#FF5555` |
| **Laranja** | - | `#FF8000` | `#FFAA55` |
| **Amarelo** | 3 / 11 | `#FFFF00` | `#FFFF77` |
| **Verde** | 2 / 10 | `#00FF00` | `#55FF55` |
| **Ciano** | 6 / 14 | `#00FFFF` | `#55FFFF` |
| **Azul** | 4 / 12 | `#0000FF` | `#5555FF` |
| **Violeta** | 5 / 13 | `#8000FF` | `#AA55FF` |
| **Preto** | 0 / 8 | `#000000` | (Border/Cinza) |
| **Branco** | 7 / 15 | `#FFFFFF` | `#FFFFFF` |

## 3. Semântica Reservada

Independente do tema aplicado, três cores mantêm significado fixo para garantir a segurança cognitiva (SRE):

*   🔴 **Vermelho (`#FF0000`):** Erro, Crítico, Falha.
*   🟡 **Amarelo (`#FFFF55`):** Aviso, Atenção.
*   🟢 **Verde (`#55FF55`):** Sucesso, String, Diff Add.

## 4. Dinâmicas de Tema

A partir da paleta pura, derivam-se as aplicações temáticas:

### A. Swap White/Violet (Assinatura)
No tema padrão (`sanxz4`), o texto principal (Foreground) não é branco, é **Violeta** (`#DD55FF` ou `#AA55FF`). O branco é usado apenas para identificadores secundários. Isso cria a estética "Cyberpunk/Neon".

### B. Temperatura (Quente vs. Frio)
Usado para separar lógica de dados.

*   **WarmCool:**
    *   🔥 **Quente (Vermelho/Laranja/Amarelo):** Ação, Números, Funções (Coisas que "acontecem").
    *   ❄️ **Frio (Azul/Ciano/Violeta):** Estrutura, Keywords, Tipos (O "esqueleto" do código).
*   **CoolWarm (Invertido):**
    *   ❄️ **Frio:** Ação e Dados.
    *   🔥 **Quente:** Estrutura e Keywords.

### C. Monocromático (Monored)
Foca em uma única fatia do espectro (ex: Vermelho), usando variações de luminosidade para hierarquia, mantendo apenas as 3 cores semânticas originais para alertas.
