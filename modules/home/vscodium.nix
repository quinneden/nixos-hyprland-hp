{ pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix # nix language
      arrterian.nix-env-selector # nix-shell suport
      catppuccin.catppuccin-vsc # Color theme
      catppuccin.catppuccin-vsc-icons # Icons
    ];
    userSettings = {
      "breadcrumbs.enabled" = false;
      "catppuccin.accentColor" = "lavender";
      "C_Cpp.autocompleteAddParentheses" = true;
      "C_Cpp.clang_format_sortIncludes" = true;
      "C_Cpp.default.browse.path" = [ ''''${workspaceFolder}/**'' ];
      "C_Cpp.default.cStandard" = "gnu11";
      "C_Cpp.doxygen.generatedStyle" = "/**";
      "C_Cpp.formatting" = "vcFormat";
      "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
      "C_Cpp.intelliSenseCacheSize" = 2048;
      "C_Cpp.intelliSenseMemoryLimit" = 2048;
      "C_Cpp.intelliSenseUpdateDelay" = 500;
      "C_Cpp.vcFormat.indent.caseLabels" = true;
      "C_Cpp.vcFormat.newLine.beforeCatch" = false;
      "C_Cpp.vcFormat.newLine.beforeElse" = false;
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
      "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
      "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
      "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
      "C_Cpp.workspaceParsingPriority" = "medium";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.minimap.enabled" = false;
      "editor.mouseWheelZoom" = true;
      "editor.renderControlCharacters" = false;
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.openEditors.visible" = 0;
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "files.autoSave" = "onWindowChange";
      "nixEnvSelector.suggestion" = false;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
      "update.mode" = "none";
      "vsicons.dontShowNewVersionMessage" = true;
      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      "workbench.activityBar.location" = "bottom";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.limit.value" = 5;
      "workbench.editor.showTabs" = "single";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.layoutControl.enabled" = true;
      "workbench.layoutControl.type" = "menu";
      "workbench.startupEditor" = "none";
      "workbench.statusBar.visible" = true;
    };
    # Keybindings
    keybindings = [
      {
        key = "ctrl+/";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "meta+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "meta+shift+w";
        command = "workbench.action.terminal.new";
        when = "terminalProcessSupported || terminalWebExtensionContributedProfile";
      }
      {
        key = "ctrl+w";
        command = "";
      }
      {
        key = "ctrl+d";
        command = "editor.action.duplicateSelection";
      }
      {
        key = "meta+shift+e";
        command = "workbench.view.explorer";
        when = "viewContainer.workbench.view.explorer.enabled";
      }
      {
        command = "editor.action.duplicateSelection";
        key = "ctrl+d";
      }
    ];
  };
}
