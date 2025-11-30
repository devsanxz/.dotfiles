# hyprctl dispatch - Guia Detalhado para Hyprland v0.52.1

Este documento detalha os comandos `hyprctl dispatch` para o Hyprland versão `0.52.1`. `hyprctl dispatch` é a ferramenta principal para interagir com o compositor e controlar seu ambiente de janela, permitindo enviar comandos para manipular janelas, workspaces e o próprio estado do compositor.

## 1. O que é `hyprctl` e `dispatch`?

*   **`hyprctl`**: É a ferramenta de linha de comando que funciona como uma interface para o daemon do Hyprland. Permite que você tanto consulte o estado atual do compositor (por exemplo, `hyprctl activewindow`) quanto envie comandos para ele executar ações.
*   **`dispatch`**: É um subcomando específico do `hyprctl` utilizado para enviar "eventos" ou "ações" ao Hyprland. Essencialmente, é como dar uma ordem direta ao compositor para que ele execute uma tarefa pré-definida, como mudar de workspace, mover uma janela, ativar um programa, entre outros. A maioria dos atalhos de teclado no Hyprland utiliza este subcomando.

## 2. Sintaxe Básica

A sintaxe geral para usar `hyprctl dispatch` é:
```bash
hyprctl dispatch <comando_do_dispatcher> [argumentos...]
```
Este comando é principalmente usado dentro do seu arquivo `hyprland.conf` para definir `binds` (atalhos de teclado personalizados), mas também pode ser executado diretamente em um terminal para testar funcionalidades ou em scripts.

## 3. Dispatchers (v0.52.1)

Aqui estão os dispatchers mais utilizados e relevantes, com explicações completas e exemplos de uso para o Hyprland v0.52.1:

---

### Execução e Controle do Sistema

*   **`exec [comando]`**: Este dispatcher executa um comando ou programa no shell. É um dos dispatchers mais fundamentais, utilizado para iniciar qualquer aplicação. O Hyprland simplesmente dispara o processo e não espera por sua conclusão.
    *   **Exemplos:**
        *   `bind = SUPER, RETURN, exec, foot`: Abre o terminal Foot ao pressionar `Super + Return`.
        *   `bind = SUPER, E, exec, dolphin`: Abre o gerenciador de arquivos Dolphin ao pressionar `Super + E`.
        *   `exec-once = foot`: Usado na configuração para iniciar o terminal Foot uma vez na inicialização do Hyprland.

*   **`execr [comando]`**: Similar ao `exec`, porém este dispatcher executa um comando "raw" (direto), sem passar por algumas etapas de processamento de shell que `exec` poderia envolver. Na prática, para a maioria dos comandos do dia a dia, `exec` é o mais adequado. `execr` pode ser útil em cenários muito específicos onde a interpretação do shell deve ser evitada.

*   **`exit`**: Encerra a sessão atual do compositor Hyprland sem pedir qualquer tipo de confirmação. É crucial usar este dispatcher com cautela, geralmente associado a uma combinação de teclas que não seja acionada acidentalmente.
    *   **Exemplo:** `bind = SUPER SHIFT, E, exit`: Sai do Hyprland ao pressionar `Super + Shift + E`.

*   **`event [comando]`**: Permite emitir um evento customizado para o socket do Hyprland. Este dispatcher é usado em cenários mais avançados, onde scripts externos ou outros componentes precisam se comunicar com o compositor, reagindo a eventos específicos ou acionando comportamentos definidos pelo usuário.

*   **`global`**: Este dispatcher é utilizado para executar um atalho global através do portal `GlobalShortcuts`. Isso permite que atalhos definidos no Hyprland possam interagir com sistemas de atalho globais de ambientes de desktop que fazem uso de portais XDG, integrando melhor a experiência do usuário.

*   **`forcendererreload`**: Força o compositor a recarregar todos os seus recursos e saídas de vídeo. É extremamente útil para aplicar mudanças em temas visuais, configurações de monitor ou plugins que não são automaticamente detectados após uma alteração. Permite aplicar as mudanças sem a necessidade de reiniciar a sessão.

*   **`sendshortcut`**: Envia uma combinação de teclas simulada (um "atalho") para uma janela específica, identificada por seu endereço. Permite que o Hyprland "emule" a pressão de teclas em um aplicativo selecionado, o que pode ser útil para automação ou interação com programas que não respondem bem a outras formas de controle.

---

### Gerenciamento de Workspaces

*   **`workspace [args]`**: Este dispatcher é uma forma versátil de gerenciar e navegar entre seus workspaces (áreas de trabalho virtuais).
    *   **Argumentos:**
        *   Um número (`1` a `N`): Muda para o workspace com o ID numérico.
        *   `e-` ou `empty`: Muda para o próximo workspace vazio disponível.
        *   `next` / `prev`: Muda para o próximo/anterior workspace na ordem numérica.
        *   `current`: Foca no workspace atualmente ativo (útil em scripts para garantir o foco).
        *   `last`: Retorna ao workspace visitado imediatamente antes do atual.
        *   `r`: Similar a `last`, retorna ao workspace visitado mais recentemente.
    *   **Exemplos:**
        *   `bind = SUPER, 1, workspace, 1`: Vai para o workspace 1.
        *   `bind = SUPER, L, workspace, next`: Vai para o próximo workspace.

*   **`togglespecialworkspace [nome]`**: Alterna a visibilidade de um "special workspace" (também conhecido como scratchpad). Um special workspace é um workspace que existe em segundo plano e pode ser invocado rapidamente para exibir aplicativos específicos (como um terminal scratchpad), sendo ocultado novamente quando não está em uso.
    *   **Exemplo:** `bind = SUPER, S, togglespecialworkspace, magic_term`: Exibe ou oculta o special workspace nomeado `magic_term`.

*   **`movetoworkspace [workspace_id]`**: Move a janela atualmente focada para o workspace especificado e, em seguida, **muda o foco para esse novo workspace**, seguindo a janela.
    *   **Exemplo:** `bind = SUPER SHIFT, 1, movetoworkspace, 1`: Move a janela ativa para o workspace 1 e foca nele.

*   **`movetoworkspacesilent [workspace_id]`**: Move a janela atualmente focada para o workspace especificado, mas **você permanece no workspace atual**. A janela é movida "silenciosamente" sem mudar seu foco.
    *   **Exemplo:** `bind = SUPER ALT, 1, movetoworkspacesilent, 1`: Move a janela activa para o workspace 1, mas você continua no workspace onde estava.

*   **`movecurrentworkspacetomonitor [monitor_id]`**: Move o workspace que está ativo (e todas as suas janelas) para o monitor especificado. Isso é especialmente útil em configurações multi-monitor para reorganizar rapidamente seus ambientes de trabalho.

*   **`moveworkspacetomonitor [workspace_id] [monitor_id]`**: Move um workspace específico (identificado pelo seu ID numérico) para um monitor diferente. Diferente do anterior, este não move o workspace atual, mas sim um workspace arbitrário.

*   **`focusworkspaceoncurrentmonitor [workspace_id]`**: Foca no workspace especificado, mas somente se este workspace já estiver presente no monitor atualmente ativo. Impede que o foco mude para um workspace em outro monitor.

*   **`renameworkspace [workspace_id] [novo_nome]`**: Permite renomear um workspace. Isso pode ser útil para organizar visualmente seus workspaces, dando nomes mais descritivos em vez de apenas números.
    *   **Exemplo:** `bind = SUPER, N, renameworkspace, 2, Dev`: Renomeia o workspace 2 para "Dev".

*   **`swapactiveworkspaces`**: Troca o conteúdo (todas as janelas) dos workspaces atualmente ativos entre dois monitores diferentes. Essencial para reorganizar rapidamente a exibição de janelas em configurações de múltiplos monitores complexas.

---

### Gerenciamento de Janelas (Movimento e Foco)

*   **`movewindow [direção]`**: Move a janela ativa dentro do layout tiling em uma das quatro direções (`l` para esquerda, `r` para direita, `u` para cima, `d` para baixo). Isso rearranja a posição da janela no layout.
    *   **Exemplo:** `bind = SUPER SHIFT, L, movewindow, r`: Move a janela ativa para a direita dentro do layout.

*   **`movewindowpixel [x] [y]`**: Move uma janela selecionada (geralmente a ativa, mas pode ser especificada por endereço) por um número de pixels nas coordenadas `x` e `y`. Útil para ajustes muito precisos da posição de janelas flutuantes.

*   **`moveactive [x] [y]`**: Move a janela ativa por um valor `x` e `y` em pixels. Similar ao `movewindowpixel`, mas explicitamente para a janela ativa e mais comum para ajustes de posição, frequentemente usado dentro de submaps. Valores positivos movem para baixo/direita; negativos para cima/esquerda.

*   **`movefocus [direção]`**: Move o foco do teclado para a próxima janela na direção especificada (`l`, `r`, `u`, `d`). Essencial para navegar entre as janelas usando apenas o teclado, sem precisar do mouse.

*   **`focuswindow [regex]`**: Foca na primeira janela que corresponde a uma expressão regular fornecida. Permite focar em uma aplicação específica pelo seu título ou classe.
    *   **Exemplo:** `bind = SUPER, F, focuswindow, ^(firefox)$`: Foca na janela do Firefox.

*   **`focuscurrentorlast`**: Alterna o foco do teclado entre a janela atualmente focada e a janela que estava focada imediatamente antes. É um atalho muito útil para alternar rapidamente entre duas aplicações que você esteja usando frequentemente.

*   **`focusurgentorlast`**: Foca na janela que está "urgente" (ou seja, solicitando atenção, como uma notificação) ou, se não houver janelas urgentes, foca na última janela utilizada.

*   **`cyclenext`**: Foca a próxima janela em sequência no workspace atual, seguindo a ordem do layout de janelas.
    *   **Exemplo:** `bind = SUPER, Tab, cyclenext`: Cicla para a próxima janela.

*   **`swapnext`**: Troca a posição da janela atualmente focada com a próxima janela na ordem do layout. Útil para reordenar janelas sem alterar o foco.

*   **`swapwindow [address]`**: Troca a posição da janela ativa com outra janela especificada por seu endereço.

*   **`centerwindow`**: Centraliza a janela ativa na tela. Extremamente útil para janelas flutuantes que precisam estar no centro da atenção.

*   **`movecursortocorner [0-3]`**: Move o cursor do mouse para um dos quatro cantos da janela ativa (0: superior esquerdo, 1: superior direito, 2: inferior direito, 3: inferior esquerdo).

*   **`movecursor [x] [y]`**: Move o cursor do mouse para uma posição absoluta na tela ou uma posição relativa à janela ativa.

---

### Gerenciamento de Janelas (Estado e Tamanho)

*   **`killactive`**: Fecha a janela que está atualmente focada. É o equivalente ao famoso "Alt+F4".
    *   **Exemplo:** `bind = SUPER, Q, killactive, `: Fecha a janela ativa.

*   **`closewindow [address]`**: Fecha uma janela específica, identificada por seu endereço. É um controle mais granular do que `killactive`.

*   **`togglefloating`**: Alterna o estado de flutuação da janela ativa. Uma janela flutuante pode ser livremente movida e redimensionada, não respeitando o layout tiling. Essencial para janelas como calculadoras ou caixas de diálogo.
    *   **Exemplo:** `bind = SUPER, F, togglefloating, `: Alterna a flutuação da janela ativa.

*   **`setfloating [0|1]`**: Define o estado de flutuação da janela ativa como verdadeiro (`1`) ou falso (`0`). `setfloating 1` força a janela a flutuar; `setfloating 0` força a janela a voltar ao tiling.

*   **`settiled [0|1]`**: Define o estado de tiling da janela ativa. `settiled 1` força a janela a ser tiled; `settiled 0` força a janela a ser flutuante. É o oposto de `setfloating`.

*   **`fullscreen [0|1]`**: Alterna ou define o estado de tela cheia da janela ativa. `fullscreen` (sem argumento) alterna; `fullscreen 1` força tela cheia; `fullscreen 0` desativa.
    *   **Exemplo:** `bind = SUPER, G, fullscreen, `: Coloca a janela ativa em tela cheia.

*   **`fakefullscreen`**: Alterna um estado interno de fullscreen para a janela focada. A janela age como se estivesse em tela cheia para o aplicativo, mas o Hyprland ainda a trata como uma janela tiled, permitindo que as janelas vizinhas permaneçam visíveis.

*   **`fullscreenstate [0|1]`**: Define o modo de fullscreen da janela focada e o estado que é reportado ao cliente (aplicativo).

*   **`resizeactive [x] [y]`**: Redimensiona a janela ativa por um valor `x` (horizontal) e `y` (vertical) em pixels. Valores positivos aumentam o tamanho, negativos diminuem.
    *   **Exemplo:** `bind = SUPER SHIFT, L, resizeactive, 100 0`: Aumenta a largura da janela ativa em 100 pixels.

*   **`resizewindowpixel [x] [y]`**: Redimensiona uma janela específica (pelo endereço, ou a ativa por default) por pixels.

*   **`alterzorder`**: Modifica a ordem de empilhamento (z-order) da janela ativa ou especificada. Define qual janela fica "por cima" das outras. Útil para gerenciar a sobreposição de janelas flutuantes.

*   **`pin`**: "Pina" uma janela, fazendo com que ela permaneça visível e no topo de outras janelas no workspace, mesmo que o foco mude.
*   **`toggleopaque`**: Alterna a opacidade de uma janela.
*   **`tagwindow`**: Aplica uma "tag" (etiqueta) a uma janela. Tags podem ser usadas em regras de janela (`windowrule`) ou scripts para organizar e filtrar janelas.

---

### Gerenciamento de Grupos de Janelas

*   **`togglegroup`**: Alterna a janela ativa para dentro ou para fora de um grupo. Grupos de janelas permitem tratar várias janelas como uma única entidade para fins de tiling e movimento.
*   **`changegroupactive [próximo]`**: Alterna o foco para a próxima janela dentro de um grupo.
*   **`lockactivegroup`**: Trava o grupo focado, impedindo que novas janelas entrem nele automaticamente.
*   **`lockgroups [0|1]`**: Bloqueia (`1`) ou desbloqueia (`0`) a criação e manipulação de todos os grupos de janelas.
*   **`moveintogroup`**: Move a janela ativa para dentro de um grupo existente.
*   **`moveoutofgroup`**: Move a janela ativa para fora de um grupo.
*   **`movegroupwindow [direção]`**: Troca a janela ativa com a próxima ou anterior dentro de um grupo.
*   **`denywindowfromgroup`**: Proíbe que a janela ativa (ou especificada) se torne parte de um grupo ou seja inserida em um. Útil para aplicativos específicos.
*   **`movewindoworgroup`**: Comporta-se como `moveintogroup` se houver um grupo próximo, ou move a janela normalmente se não houver.
*   **`setignoregrouplock [0|1]`**: Ativa (`1`) ou desativa (`0`) temporariamente a opção `binds:ignore_group_lock`.

---

### Layouts e Ajustes

*   **`layoutmsg [comando]`**: Envia comandos específicos para o layout ativo (por exemplo, `dwindle`, `master`).
    *   **Exemplo:** `bind = SUPER, P, layoutmsg, pseudotile`: No layout `dwindle`, alterna o modo `pseudotile` para a janela ativa.
*   **`splitratio [ratio]`**: Altera a proporção de divisão de janelas no layout ativo.
    *   **Exemplo:** `bind = SUPER, S, splitratio, 0.5`: Define a proporção de divisão para 50%.

---

### Modos de Teclado (Keymaps)

*   **`submap [nome_do_mapa]`**: Altera o grupo de atalhos de teclado ativo para o `nome_do_mapa` especificado. Permite criar modos contextuais de atalhos.
*   **`submap reset`**: Retorna ao grupo de atalhos padrão, desativando qualquer `submap` ativo.

---

### Hardware

*   **`dpms [on|off|toggle]`**: Define o status DPMS (Display Power Management Signaling) de todos os monitores. `on` liga, `off` desliga, `toggle` alterna o estado atual dos monitores.
*   **`focusmonitor [direção]`**: Foca em um monitor específico.

---

### Pass-through

*   **`pass [endereço]`**: Passa o evento da tecla diretamente para uma janela específica, ignorando quaisquer atalhos do Hyprland. Útil para janelas que precisam interceptar todas as combinações de teclado.

---

## 4. Integração com `bind` (Seus Atalhos)

No seu `hyprland.conf`, você usa o `bind` para associar esses dispatchers a combinações de teclas:

```ini
# Sintaxe: bind = [MODIFICADORES], [TECLA], [dispatcher], [comando_do_dispatcher]
bind = SUPER, Q, killactive,  # Fecha janela ativa
bind = SUPER, M, exec, hyprctl reload # Recarrega o Hyprland
```

## 5. Exemplo Prático

Com este guia detalhado, você deve ser capaz de ler seus arquivos de configuração do Hyprland e entender precisamente o que cada atalho está fazendo. Isso lhe dará a confiança para criar novos atalhos personalizados e otimizar seu fluxo de trabalho.
END_OF_HYPRCTL_DOC