{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  home.packages = with (pkgs.callPackage ../../../pkgs/R.nix { }); [
    (config.lib.misc.addFlags
      "--enable-features=UseOzonePlatform --ozone-platform=wayland --use-gl=angle --wayland-text-input-version=3"
      "rstudio"
      myRstudio
    )
    myR
  ];
  xdg.configFile."rstudio/themes/stylix.rstheme".text = with colors; ''
    /* rsthemes 0.5.0 */
    /* https://github.com/danth/stylix */
    /* rs-theme-name: base16-Stylix */
    /* Stylix module by Grady B */
    /* rs-theme-is-dark: TRUE */

    .ace_gutter {
      background: ${base02};
      color: ${base07}80;
    }

    .ace_print-margin {
      width: 2px;
      background: ${base05}26;
    }

    .ace_editor {
      background-color: ${base00};
      color: ${base07};
    }

    .rstudio-themes-flat.ace_editor_theme {
      background-color: ${base00};
      color: ${base07};
    }

    .rstudio-themes-flat.ace_editor_theme .profvis-flamegraph {
      background-color: ${base00};
      color: ${base07};
    }

    .rstudio-themes-flat .ace_editor_theme {
      background-color: ${base00};
      color: ${base07};
    }

    .rstudio-themes-flat.editor_dark.ace_editor_theme a {
      color: #FFF !important;
    }

    .rstudio-themes-flat .gwt-Label {
      color: ${base07};
    }

    .ace_cursor {
      color: ${base0A};
    }

    .normal-mode .ace_cursor {
      border: 0 !important;
      background-color: ${base0A};
    }

    .ace_marker-layer .ace_selection {
      background: ${base05}66;
    }

    .ace_marker-layer .ace_step {
      background: #a6b189;
    }

    .ace_marker-layer .ace_bracket {
      margin: -1px 0 0 -1px;
      border: 1px solid ${base02};
    }

    .ace_marker-layer .ace_active-line {
      background: #11111180;
    }

    .ace_marker-layer .ace_selected-word {
      border: 1px solid ${base05}66;
    }

    .ace_marker-layer .ace_foreign_line {
      position: absolute;
      z-index: -1;
      background-color: ${base01};
    }

    .ace_marker-layer .ace_active_debug_line {
      position: absolute;
      z-index: -1;
      background-color: #383838;
    }

    .ace_marker-layer .ace_find_line {
      position: absolute;
      z-index: -1;
      background-color: ${base01};
    }

    .ace_gutter-active-line {
      background-color: ${base01};
    }

    .ace_fold {
      background-color: ${base08};
      border: 1px solid ${base07} !important;
    }

    .ace_indent-guide {
      display: inline-block;
      height: 100%;
      box-shadow: 1px 0 0 ${base02};
    }

    .ace_active-line ~ .ace_selection.ace_start {
      background-color: ${base02};
    }

    .ace_keyword {
      font-style: normal;
      color: ${base0E};
    }

    .ace_keyword.ace_operator {
      font-style: normal;
      color: ${base0C};
    }

    .ace_keyword.ace_other.ace_unit {
      font-style: normal;
      color: ${base05};
    }

    .ace_constant.ace_language {
      color: ${base0F};
    }

    .ace_constant.ace_numeric {
      color: ${base05};
    }

    .ace_constant.ace_character {
      color: ${base05};
    }

    .ace_constant.ace_other {
      color: ${base07};
    }

    .ace_support.ace_function {
      color: ${base0D};
    }

    .ace_support.ace_constant {
      color: ${base05};
    }

    .ace_support.ace_class {
      font-style: italic;
      color: ${base0A};
    }

    .ace_support.ace_type {
      color: ${base0A};
    }

    .ace_paren.ace_keyword.ace_operator {
      color: ${base0C};
    }

    .ace_storage {
      color: ${base0E};
    }

    .ace_storage.ace_type {
      color: ${base0E};
    }

    .ace_invalid {
      background-color: ${base08}80;
    }

    .ace_invalid.ace_deprecated {
      background-color: ${base0E}80;
    }

    .ace_string {
      color: ${base0B};
    }

    .ace_comment {
      color: ${base04};
    }

    .ace_invisible {
      color: ${base03};
    }

    .ace_variable {
      color: ${base08};
    }

    .ace_variable.ace_parameter {
      color: ${base05};
    }

    .ace_identifier {
      color: ${base07};
      background-color: inherit;
    }

    .ace_entity.ace_name.ace_function {
      color: ${base0D};
    }

    .ace_entity.ace_name.ace_tag {
      color: ${base08};
    }

    .ace_entity.ace_other.ace_attribute-name {
      color: ${base0E};
    }

    .ace_bracket {
      margin: 0 !important;
      border: 0 !important;
      background-color: ${base02};
    }

    .ace_console_error {
      background-color: ${base01};
    }

    .ace_layer {
      z-index: 4;
    }

    .ace_layer.ace_print-margin-layer {
      z-index: 2;
    }

    .ace_layer.ace_marker-layer {
      z-index: 1;
    }

    .ace_layer.ace_cursor-layer {
      z-index: 3;
    }

    .ace_selection.ace_start {
      box-shadow: 0 0 3px 0 ${base00};
      border-radius: 2px;
    }

    .ace_meta.ace_tag {
      color: ${base0C};
    }

    .ace_markup.ace_heading,
    .ace_markup.ace_heading ~ .ace_heading {
      font-weight: 600;
      color: ${base0B};
    }

    .ace_support.ace_function.ace_codebegin, .ace_support.ace_function.ace_codeend {
      color: ${base0D};
    }

    .ace_markup.ace_href {
      color: ${base0E};
    }

    .nocolor.ace_editor .ace_line span {
      color: ${base0E} !important;
    }

    #rstudio_console_input .ace_marker-layer .ace_selection {
      background: ${base05}66;
    }

    /* ---- RStudio Theme ---- */
    /* background */
    .rstudio-themes-flat .rstudio-themes-dark-grey {
      background: ${base01} !important;
      color: ${base07} !important;
      /* collapsed toolbar on rstudio server */
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .rstudio-themes-background {
      background: ${base01} !important;
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey [role="banner"] + [role="navigation"] > table > tbody > tr > td,
    .rstudio-themes-flat .rstudio-themes-dark-grey header + [role="navigation"] > table > tbody > tr > td {
      background: ${base01};
      border-color: ${base00};
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .rstudio-themes-border {
      border-color: ${base00};
    }

    /* inactive tabs */
    table.rstheme_tabLayoutCenter,
    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-TabLayoutPanelTabs,
    .rstheme_multiPodUtilityTabArea {
      background: ${base01} !important;
    }

    table.rstheme_tabLayoutCenter .gwt-Label,
    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-TabLayoutPanelTabs .gwt-Label,
    .rstheme_multiPodUtilityTabArea .gwt-Label {
      color: ${base04};
    }

    /* toolbar and selected tab */
    .rstudio-themes-flat .rstudio-themes-dark-grey .rstheme_center,
    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-TabLayoutPanelTabs .gwt-TabLayoutPanelTab-selected table.rstheme_tabLayoutCenter {
      background: ${base02} !important;
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-TabLayoutPanelTab-selected .gwt-Label {
      color: ${base07};
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-TabLayoutPanelTab:hover .rstheme_tabLayoutCenter {
      background: ${base01} !important;
    }

    .rstudio-themes-flat .rstheme_toolbarWrapper {
      background: ${base02} !important;
    }

    .rstudio-themes-flat .rstheme_toolbarWrapper button, .rstudio-themes-flat .rstheme_toolbarWrapper a, .rstudio-themes-flat .rstheme_toolbarWrapper div {
      color: ${base07} !important;
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-SplitLayoutPanel-HDragger, .rstudio-themes-flat .rstudio-themes-dark-grey .gwt-SplitLayoutPanel-VDragger {
      /* spliters */
      background: transparent !important;
    }

    .rstudio-themes-flat .rstudio-themes-dark .search, .rstudio-themes-flat.rstudio-themes-dark-menus .search {
      /* search */
      background: ${base02} !important;
    }

    .rstudio-themes-flat #rstudio_workbench_panel_find_in_files td[colspan="2"] {
      /* file name in Find in Files */
      color: ${base0F};
    }

    /* pane toolbars */
    .rstheme_secondaryToolbar, .rstudio-themes-flat .rstudio-themes-dark-grey .dataGridHeader {
      background: ${base02} !important;
    }

    /* menu background */
    .rstudio-themes-flat .popupMiddleCenter,
    .rstudio-themes-flat .menuPopupMiddleCenter,
    .rstudio-themes-flat .suggestPopupMiddleCenter {
      background: ${base00} !important;
      color: ${base07} !important;
    }

    .rstudio-themes-flat .popupMiddleCenter .item.item-selected,
    .rstudio-themes-flat .menuPopupMiddleCenter .item.item-selected,
    .rstudio-themes-flat .suggestPopupMiddleCenter .item.item-selected {
      color: ${base07} !important;
      background: ${base02} !important;
    }

    .rstudio-themes-flat .themedPopupPanel {
      border: solid 1px ${base02};
    }

    .rstudio-themes-flat .themedPopupPanel ~ div.popupContent div:nth-child(1) {
      border: solid 1px ${base02};
    }

    .rstudio-themes-flat .popupContent {
      background: ${base00};
      color: ${base07};
      border-color: ${base02};
    }

    .rstudio-themes-flat .popupContent:not(.popupMiddleCenterInner) div div:nth-child(2) {
      background-color: unset;
      border: none;
    }

    .rstudio-themes-flat .popupContent + .rstudio-themes-scrollbars {
      border-color: ${base02};
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent {
      background: ${base00};
      padding: 2px;
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent table {
      background: ${base07};
      border: 0;
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent table .gwt-Label {
      color: ${base00};
    }

    .rstudio-themes-flat.rstudio-themes-dark-menus .gwt-MenuItem.gwt-MenuItem-selected, .rstudio-themes-flat.rstudio-themes-dark-menus .gwt-MenuItem.gwt-MenuItem-selected > table {
      background: ${base02};
      color: ${base07};
    }

    /* datagrid */
    .rstudio-themes-dark .dataGridHeader,
    .rstudio-themes-dark tr[__gwt_header_row] > :-webkit-any(td, th),
    .rstudio-themes-dark .dataTables_info {
      background-color: ${base00} !important;
      border-color: ${base01} !important;
    }

    /* hacky toolbars section */
    .rstudio-themes-flat .rstudio-themes-dark-grey {
      /* this next one might not be needed anymore (at least after 1.4+) */
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .windowframe > div:last-child > div > div > div > div > div:not(.gwt-TabLayoutPanelTabs) {
      background: ${base01} !important;
    }

    .rstudio-themes-flat .rstudio-themes-dark-grey .windowframe > div:last-child > div > div > div:nth-child(3) > div {
      background: ${base01} !important;
    }

    /* Data Frame Preview */
    .dataTables_wrapper thead th {
      background-color: #3a3e42 !important;
      color: ${base07} !important;
    }

    .dataTables_scrollBody table tbody td:first-child {
      background: #3a3e42 !important;
      color: ${base07} !important;
    }

    .dataTables_info {
      background: #3a3e42 !important;
      color: ${base07} !important;
    }

    /* scrollbars */
    /* reset scrollbar background color */
    .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars ::-webkit-scrollbar,
    .rstudio-themes-flat .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars::-webkit-scrollbar, .rstudio-themes-flat.rstudio-themes-dark-menus .rstudio-themes-scrollbars ::-webkit-scrollbar {
      background-color: unset;
    }

    .rstudio-themes-flat .ace_scroller {
      overflow: visible;
    }

    .rstudio-themes-flat, .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars {
      /* Works on Firefox */
      scrollbar-width: auto;
      scrollbar-color: ${base01} ${base00}80;
      /* Works on Chrome, Edge, and Safari */
    }

    .rstudio-themes-flat ::-webkit-scrollbar, .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars ::-webkit-scrollbar {
      width: auto;
    }

    .rstudio-themes-flat *::-webkit-scrollbar-track, .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars *::-webkit-scrollbar-track {
      background: ${base00}80;
    }

    .rstudio-themes-flat *::-webkit-scrollbar-thumb, .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars *::-webkit-scrollbar-thumb {
      background-color: ${base01};
      border-radius: 0px;
      border: 2px solid ${base00};
    }

    .rstudio-themes-flat *::-webkit-scrollbar-thumb:hover, .rstudio-themes-flat .rstudio-themes-dark.rstudio-themes-scrollbars *::-webkit-scrollbar-thumb:hover {
      background-color: #3e4244;
    }

    /* fix overly zealous css rules */
    .gwt-DialogBox-ModalDialog .dialogContent .gwt-Label {
      color: #333333;
    }

    /* job progress bar */
    .rstheme_toolbarWrapper [role="progressbar"] > div, .windowframe [role="progressbar"] > div {
      background-color: ${base05};
    }

    #rstudio_command_palette_search,
    #rstudio_command_palette_list [id^="rstudio_command_"],
    input#rstudio_command_palette_search {
      background-color: ${base00};
      border: none;
    }

    #rstudio_command_palette_list {
      background-color: ${base00};
      border-color: ${base00};
    }

    .rstudio-themes-flat .rstudio-themes-border {
      border-color: ${base00};
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"] table .gwt-Label,
    .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"] table td {
      background-color: ${base00};
      color: ${base07};
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"]:hover, .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"]:hover [id^="rstudio_command_entry"], .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"]:hover table .gwt-Label, .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [id*="rstudio_command_"]:hover table td {
      background-color: #2b2b2b;
    }

    .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [aria-selected="true"], .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [aria-selected="true"] [id^="rstudio_command_entry"], .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [aria-selected="true"] table .gwt-Label, .rstudio-themes-flat .gwt-PopupPanel .popupContent #rstudio_command_palette_list [aria-selected="true"] table td {
      background-color: #383838;
    }

    input#rstudio_command_palette_search {
      padding: 10px 0;
      width: 580px;
      border: none;
    }

    .js-focus-visible input#rstudio_command_palette_search {
      outline-offset: 5px !important;
    }

    .rstudio-themes-flat .popupContent [id^="rstudio_command"] [id^="rstudio_command_entry_"] .gwt-Label, .rstudio-themes-flat .popupContent [id^="rstudio_command"] [id^="rstudio_command_entry_"] .gwt-Label span {
      border: none;
    }

    /* Rainbow Parenthesis */
    .rstudio-themes-dark .ace_paren_color_0 {
      color: ${base0C};
    }

    .rstudio-themes-dark .ace_paren_color_1 {
      color: ${base0D};
    }

    .rstudio-themes-dark .ace_paren_color_2 {
      color: ${base0A};
    }

    .rstudio-themes-dark .ace_paren_color_3 {
      color: ${base05};
    }

    .rstudio-themes-dark .ace_paren_color_4 {
      color: ${base08};
    }

    .rstudio-themes-dark .ace_paren_color_5 {
      color: ${base0B};
    }

    .rstudio-themes-dark .ace_paren_color_6 {
      color: ${base0E};
    }

    .terminal {
      background-color: ${base00};
      color: ${base07};
      font-feature-settings: "liga" 0;
      position: relative;
      user-select: none;
      -ms-user-select: none;
      -webkit-user-select: none;
    }

    .terminal.xterm-cursor-style-block.focus:not(.xterm-cursor-blink-on) .terminal-cursor {
      background-color: ${base0A};
      color: ${base0A};
    }

    .terminal.focus.xterm-cursor-style-bar:not(.xterm-cursor-blink-on) .terminal-cursor::before, .terminal.focus.xterm-cursor-style-underline:not(.xterm-cursor-blink-on) .terminal-cursor::before {
      content: \'\';
      position: absolute;
      background-color: ${base00};
    }

    .terminal:not(.focus) .terminal-cursor {
      outline: 1px solid ${base07};
      outline-offset: -1px;
    }

    .terminal .xterm-selection {
      opacity: 1 !important;
      z-index: 0 !important;
    }

    .terminal .xterm-selection div {
      position: absolute;
      background-color: ${base05}66;
    }

    .terminal .xterm-viewport {
      background-color: ${base00};
      overflow-y: scroll;
    }

    .xtermInvertColor {
      color: ${base07};
    }

    .xtermInvertBgColor {
      background-color: ${base00};
    }

    .xtermBold {
      font-weight: bold;
    }

    .xtermUnderline {
      text-decoration: underline;
    }

    .xtermBlink {
      text-decoration: blink;
    }

    .xtermHidden {
      visibility: hidden;
    }

    .xtermItalic {
      font-style: italic;
    }

    .xtermStrike {
      text-decoration: line-through;
    }

    .xtermColor0 {
      color: #2e3436 !important;
    }

    .xtermBgColor0 {
      background-color: #2e3436;
    }

    .xtermColor1 {
      color: #cc0000 !important;
    }

    .xtermBgColor1 {
      background-color: #cc0000;
    }

    .xtermColor2 {
      color: #4e9a06 !important;
    }

    .xtermBgColor2 {
      background-color: #4e9a06;
    }

    .xtermColor3 {
      color: #c4a000 !important;
    }

    .xtermBgColor3 {
      background-color: #c4a000;
    }

    .xtermColor4 {
      color: #3465a4 !important;
    }

    .xtermBgColor4 {
      background-color: #3465a4;
    }

    .xtermColor5 {
      color: #75507b !important;
    }

    .xtermBgColor5 {
      background-color: #75507b;
    }

    .xtermColor6 {
      color: #06989a !important;
    }

    .xtermBgColor6 {
      background-color: #06989a;
    }

    .xtermColor7 {
      color: #d3d7cf !important;
    }

    .xtermBgColor7 {
      background-color: #d3d7cf;
    }

    .xtermColor8 {
      color: #555753 !important;
    }

    .xtermBgColor8 {
      background-color: #555753;
    }

    .xtermColor9 {
      color: #ef2929 !important;
    }

    .xtermBgColor9 {
      background-color: #ef2929;
    }

    .xtermColor10 {
      color: #8ae234 !important;
    }

    .xtermBgColor10 {
      background-color: #8ae234;
    }

    .xtermColor11 {
      color: #fce94f !important;
    }

    .xtermBgColor11 {
      background-color: #fce94f;
    }

    .xtermColor12 {
      color: #729fcf !important;
    }

    .xtermBgColor12 {
      background-color: #729fcf;
    }

    .xtermColor13 {
      color: #ad7fa8 !important;
    }

    .xtermBgColor13 {
      background-color: #ad7fa8;
    }

    .xtermColor14 {
      color: #34e2e2 !important;
    }

    .xtermBgColor14 {
      background-color: #34e2e2;
    }

    .xtermColor15 {
      color: #eeeeec !important;
    }

    .xtermBgColor15 {
      background-color: #eeeeec;
    }

    .xtermColor16 {
      color: #000000 !important;
    }

    .xtermBgColor16 {
      background-color: #000000;
    }

    .xtermColor17 {
      color: #00005f !important;
    }

    .xtermBgColor17 {
      background-color: #00005f;
    }

    .xtermColor18 {
      color: #000087 !important;
    }

    .xtermBgColor18 {
      background-color: #000087;
    }

    .xtermColor19 {
      color: #0000af !important;
    }

    .xtermBgColor19 {
      background-color: #0000af;
    }

    .xtermColor20 {
      color: #0000d7 !important;
    }

    .xtermBgColor20 {
      background-color: #0000d7;
    }

    .xtermColor21 {
      color: #0000ff !important;
    }

    .xtermBgColor21 {
      background-color: #0000ff;
    }

    .xtermColor22 {
      color: #005f00 !important;
    }

    .xtermBgColor22 {
      background-color: #005f00;
    }

    .xtermColor23 {
      color: #005f5f !important;
    }

    .xtermBgColor23 {
      background-color: #005f5f;
    }

    .xtermColor24 {
      color: #005f87 !important;
    }

    .xtermBgColor24 {
      background-color: #005f87;
    }

    .xtermColor25 {
      color: #005faf !important;
    }

    .xtermBgColor25 {
      background-color: #005faf;
    }

    .xtermColor26 {
      color: #005fd7 !important;
    }

    .xtermBgColor26 {
      background-color: #005fd7;
    }

    .xtermColor27 {
      color: #005fff !important;
    }

    .xtermBgColor27 {
      background-color: #005fff;
    }

    .xtermColor28 {
      color: #008700 !important;
    }

    .xtermBgColor28 {
      background-color: #008700;
    }

    .xtermColor29 {
      color: #00875f !important;
    }

    .xtermBgColor29 {
      background-color: #00875f;
    }

    .xtermColor30 {
      color: #008787 !important;
    }

    .xtermBgColor30 {
      background-color: #008787;
    }

    .xtermColor31 {
      color: #0087af !important;
    }

    .xtermBgColor31 {
      background-color: #0087af;
    }

    .xtermColor32 {
      color: #0087d7 !important;
    }

    .xtermBgColor32 {
      background-color: #0087d7;
    }

    .xtermColor33 {
      color: #0087ff !important;
    }

    .xtermBgColor33 {
      background-color: #0087ff;
    }

    .xtermColor34 {
      color: #00af00 !important;
    }

    .xtermBgColor34 {
      background-color: #00af00;
    }

    .xtermColor35 {
      color: #00af5f !important;
    }

    .xtermBgColor35 {
      background-color: #00af5f;
    }

    .xtermColor36 {
      color: #00af87 !important;
    }

    .xtermBgColor36 {
      background-color: #00af87;
    }

    .xtermColor37 {
      color: #00afaf !important;
    }

    .xtermBgColor37 {
      background-color: #00afaf;
    }

    .xtermColor38 {
      color: #00afd7 !important;
    }

    .xtermBgColor38 {
      background-color: #00afd7;
    }

    .xtermColor39 {
      color: #00afff !important;
    }

    .xtermBgColor39 {
      background-color: #00afff;
    }

    .xtermColor40 {
      color: #00d700 !important;
    }

    .xtermBgColor40 {
      background-color: #00d700;
    }

    .xtermColor41 {
      color: #00d75f !important;
    }

    .xtermBgColor41 {
      background-color: #00d75f;
    }

    .xtermColor42 {
      color: #00d787 !important;
    }

    .xtermBgColor42 {
      background-color: #00d787;
    }

    .xtermColor43 {
      color: #00d7af !important;
    }

    .xtermBgColor43 {
      background-color: #00d7af;
    }

    .xtermColor44 {
      color: #00d7d7 !important;
    }

    .xtermBgColor44 {
      background-color: #00d7d7;
    }

    .xtermColor45 {
      color: #00d7ff !important;
    }

    .xtermBgColor45 {
      background-color: #00d7ff;
    }

    .xtermColor46 {
      color: #00ff00 !important;
    }

    .xtermBgColor46 {
      background-color: #00ff00;
    }

    .xtermColor47 {
      color: #00ff5f !important;
    }

    .xtermBgColor47 {
      background-color: #00ff5f;
    }

    .xtermColor48 {
      color: #00ff87 !important;
    }

    .xtermBgColor48 {
      background-color: #00ff87;
    }

    .xtermColor49 {
      color: #00ffaf !important;
    }

    .xtermBgColor49 {
      background-color: #00ffaf;
    }

    .xtermColor50 {
      color: #00ffd7 !important;
    }

    .xtermBgColor50 {
      background-color: #00ffd7;
    }

    .xtermColor51 {
      color: #00ffff !important;
    }

    .xtermBgColor51 {
      background-color: #00ffff;
    }

    .xtermColor52 {
      color: #5f0000 !important;
    }

    .xtermBgColor52 {
      background-color: #5f0000;
    }

    .xtermColor53 {
      color: #5f005f !important;
    }

    .xtermBgColor53 {
      background-color: #5f005f;
    }

    .xtermColor54 {
      color: #5f0087 !important;
    }

    .xtermBgColor54 {
      background-color: #5f0087;
    }

    .xtermColor55 {
      color: #5f00af !important;
    }

    .xtermBgColor55 {
      background-color: #5f00af;
    }

    .xtermColor56 {
      color: #5f00d7 !important;
    }

    .xtermBgColor56 {
      background-color: #5f00d7;
    }

    .xtermColor57 {
      color: #5f00ff !important;
    }

    .xtermBgColor57 {
      background-color: #5f00ff;
    }

    .xtermColor58 {
      color: #5f5f00 !important;
    }

    .xtermBgColor58 {
      background-color: #5f5f00;
    }

    .xtermColor59 {
      color: #5f5f5f !important;
    }

    .xtermBgColor59 {
      background-color: #5f5f5f;
    }

    .xtermColor60 {
      color: #5f5f87 !important;
    }

    .xtermBgColor60 {
      background-color: #5f5f87;
    }

    .xtermColor61 {
      color: #5f5faf !important;
    }

    .xtermBgColor61 {
      background-color: #5f5faf;
    }

    .xtermColor62 {
      color: #5f5fd7 !important;
    }

    .xtermBgColor62 {
      background-color: #5f5fd7;
    }

    .xtermColor63 {
      color: #5f5fff !important;
    }

    .xtermBgColor63 {
      background-color: #5f5fff;
    }

    .xtermColor64 {
      color: #5f8700 !important;
    }

    .xtermBgColor64 {
      background-color: #5f8700;
    }

    .xtermColor65 {
      color: #5f875f !important;
    }

    .xtermBgColor65 {
      background-color: #5f875f;
    }

    .xtermColor66 {
      color: #5f8787 !important;
    }

    .xtermBgColor66 {
      background-color: #5f8787;
    }

    .xtermColor67 {
      color: #5f87af !important;
    }

    .xtermBgColor67 {
      background-color: #5f87af;
    }

    .xtermColor68 {
      color: #5f87d7 !important;
    }

    .xtermBgColor68 {
      background-color: #5f87d7;
    }

    .xtermColor69 {
      color: #5f87ff !important;
    }

    .xtermBgColor69 {
      background-color: #5f87ff;
    }

    .xtermColor70 {
      color: #5faf00 !important;
    }

    .xtermBgColor70 {
      background-color: #5faf00;
    }

    .xtermColor71 {
      color: #5faf5f !important;
    }

    .xtermBgColor71 {
      background-color: #5faf5f;
    }

    .xtermColor72 {
      color: #5faf87 !important;
    }

    .xtermBgColor72 {
      background-color: #5faf87;
    }

    .xtermColor73 {
      color: #5fafaf !important;
    }

    .xtermBgColor73 {
      background-color: #5fafaf;
    }

    .xtermColor74 {
      color: #5fafd7 !important;
    }

    .xtermBgColor74 {
      background-color: #5fafd7;
    }

    .xtermColor75 {
      color: #5fafff !important;
    }

    .xtermBgColor75 {
      background-color: #5fafff;
    }

    .xtermColor76 {
      color: #5fd700 !important;
    }

    .xtermBgColor76 {
      background-color: #5fd700;
    }

    .xtermColor77 {
      color: #5fd75f !important;
    }

    .xtermBgColor77 {
      background-color: #5fd75f;
    }

    .xtermColor78 {
      color: #5fd787 !important;
    }

    .xtermBgColor78 {
      background-color: #5fd787;
    }

    .xtermColor79 {
      color: #5fd7af !important;
    }

    .xtermBgColor79 {
      background-color: #5fd7af;
    }

    .xtermColor80 {
      color: #5fd7d7 !important;
    }

    .xtermBgColor80 {
      background-color: #5fd7d7;
    }

    .xtermColor81 {
      color: #5fd7ff !important;
    }

    .xtermBgColor81 {
      background-color: #5fd7ff;
    }

    .xtermColor82 {
      color: #5fff00 !important;
    }

    .xtermBgColor82 {
      background-color: #5fff00;
    }

    .xtermColor83 {
      color: #5fff5f !important;
    }

    .xtermBgColor83 {
      background-color: #5fff5f;
    }

    .xtermColor84 {
      color: #5fff87 !important;
    }

    .xtermBgColor84 {
      background-color: #5fff87;
    }

    .xtermColor85 {
      color: #5fffaf !important;
    }

    .xtermBgColor85 {
      background-color: #5fffaf;
    }

    .xtermColor86 {
      color: #5fffd7 !important;
    }

    .xtermBgColor86 {
      background-color: #5fffd7;
    }

    .xtermColor87 {
      color: #5fffff !important;
    }

    .xtermBgColor87 {
      background-color: #5fffff;
    }

    .xtermColor88 {
      color: #870000 !important;
    }

    .xtermBgColor88 {
      background-color: #870000;
    }

    .xtermColor89 {
      color: #87005f !important;
    }

    .xtermBgColor89 {
      background-color: #87005f;
    }

    .xtermColor90 {
      color: #870087 !important;
    }

    .xtermBgColor90 {
      background-color: #870087;
    }

    .xtermColor91 {
      color: #8700af !important;
    }

    .xtermBgColor91 {
      background-color: #8700af;
    }

    .xtermColor92 {
      color: #8700d7 !important;
    }

    .xtermBgColor92 {
      background-color: #8700d7;
    }

    .xtermColor93 {
      color: #8700ff !important;
    }

    .xtermBgColor93 {
      background-color: #8700ff;
    }

    .xtermColor94 {
      color: #875f00 !important;
    }

    .xtermBgColor94 {
      background-color: #875f00;
    }

    .xtermColor95 {
      color: #875f5f !important;
    }

    .xtermBgColor95 {
      background-color: #875f5f;
    }

    .xtermColor96 {
      color: #875f87 !important;
    }

    .xtermBgColor96 {
      background-color: #875f87;
    }

    .xtermColor97 {
      color: #875faf !important;
    }

    .xtermBgColor97 {
      background-color: #875faf;
    }

    .xtermColor98 {
      color: #875fd7 !important;
    }

    .xtermBgColor98 {
      background-color: #875fd7;
    }

    .xtermColor99 {
      color: #875fff !important;
    }

    .xtermBgColor99 {
      background-color: #875fff;
    }

    .xtermColor100 {
      color: #878700 !important;
    }

    .xtermBgColor100 {
      background-color: #878700;
    }

    .xtermColor101 {
      color: #87875f !important;
    }

    .xtermBgColor101 {
      background-color: #87875f;
    }

    .xtermColor102 {
      color: #878787 !important;
    }

    .xtermBgColor102 {
      background-color: #878787;
    }

    .xtermColor103 {
      color: #8787af !important;
    }

    .xtermBgColor103 {
      background-color: #8787af;
    }

    .xtermColor104 {
      color: #8787d7 !important;
    }

    .xtermBgColor104 {
      background-color: #8787d7;
    }

    .xtermColor105 {
      color: #8787ff !important;
    }

    .xtermBgColor105 {
      background-color: #8787ff;
    }

    .xtermColor106 {
      color: #87af00 !important;
    }

    .xtermBgColor106 {
      background-color: #87af00;
    }

    .xtermColor107 {
      color: #87af5f !important;
    }

    .xtermBgColor107 {
      background-color: #87af5f;
    }

    .xtermColor108 {
      color: #87af87 !important;
    }

    .xtermBgColor108 {
      background-color: #87af87;
    }

    .xtermColor109 {
      color: #87afaf !important;
    }

    .xtermBgColor109 {
      background-color: #87afaf;
    }

    .xtermColor110 {
      color: #87afd7 !important;
    }

    .xtermBgColor110 {
      background-color: #87afd7;
    }

    .xtermColor111 {
      color: #87afff !important;
    }

    .xtermBgColor111 {
      background-color: #87afff;
    }

    .xtermColor112 {
      color: #87d700 !important;
    }

    .xtermBgColor112 {
      background-color: #87d700;
    }

    .xtermColor113 {
      color: #87d75f !important;
    }

    .xtermBgColor113 {
      background-color: #87d75f;
    }

    .xtermColor114 {
      color: #87d787 !important;
    }

    .xtermBgColor114 {
      background-color: #87d787;
    }

    .xtermColor115 {
      color: #87d7af !important;
    }

    .xtermBgColor115 {
      background-color: #87d7af;
    }

    .xtermColor116 {
      color: #87d7d7 !important;
    }

    .xtermBgColor116 {
      background-color: #87d7d7;
    }

    .xtermColor117 {
      color: #87d7ff !important;
    }

    .xtermBgColor117 {
      background-color: #87d7ff;
    }

    .xtermColor118 {
      color: #87ff00 !important;
    }

    .xtermBgColor118 {
      background-color: #87ff00;
    }

    .xtermColor119 {
      color: #87ff5f !important;
    }

    .xtermBgColor119 {
      background-color: #87ff5f;
    }

    .xtermColor120 {
      color: #87ff87 !important;
    }

    .xtermBgColor120 {
      background-color: #87ff87;
    }

    .xtermColor121 {
      color: #87ffaf !important;
    }

    .xtermBgColor121 {
      background-color: #87ffaf;
    }

    .xtermColor122 {
      color: #87ffd7 !important;
    }

    .xtermBgColor122 {
      background-color: #87ffd7;
    }

    .xtermColor123 {
      color: #87ffff !important;
    }

    .xtermBgColor123 {
      background-color: #87ffff;
    }

    .xtermColor124 {
      color: #af0000 !important;
    }

    .xtermBgColor124 {
      background-color: #af0000;
    }

    .xtermColor125 {
      color: #af005f !important;
    }

    .xtermBgColor125 {
      background-color: #af005f;
    }

    .xtermColor126 {
      color: #af0087 !important;
    }

    .xtermBgColor126 {
      background-color: #af0087;
    }

    .xtermColor127 {
      color: #af00af !important;
    }

    .xtermBgColor127 {
      background-color: #af00af;
    }

    .xtermColor128 {
      color: #af00d7 !important;
    }

    .xtermBgColor128 {
      background-color: #af00d7;
    }

    .xtermColor129 {
      color: #af00ff !important;
    }

    .xtermBgColor129 {
      background-color: #af00ff;
    }

    .xtermColor130 {
      color: #af5f00 !important;
    }

    .xtermBgColor130 {
      background-color: #af5f00;
    }

    .xtermColor131 {
      color: #af5f5f !important;
    }

    .xtermBgColor131 {
      background-color: #af5f5f;
    }

    .xtermColor132 {
      color: #af5f87 !important;
    }

    .xtermBgColor132 {
      background-color: #af5f87;
    }

    .xtermColor133 {
      color: #af5faf !important;
    }

    .xtermBgColor133 {
      background-color: #af5faf;
    }

    .xtermColor134 {
      color: #af5fd7 !important;
    }

    .xtermBgColor134 {
      background-color: #af5fd7;
    }

    .xtermColor135 {
      color: #af5fff !important;
    }

    .xtermBgColor135 {
      background-color: #af5fff;
    }

    .xtermColor136 {
      color: #af8700 !important;
    }

    .xtermBgColor136 {
      background-color: #af8700;
    }

    .xtermColor137 {
      color: #af875f !important;
    }

    .xtermBgColor137 {
      background-color: #af875f;
    }

    .xtermColor138 {
      color: #af8787 !important;
    }

    .xtermBgColor138 {
      background-color: #af8787;
    }

    .xtermColor139 {
      color: #af87af !important;
    }

    .xtermBgColor139 {
      background-color: #af87af;
    }

    .xtermColor140 {
      color: #af87d7 !important;
    }

    .xtermBgColor140 {
      background-color: #af87d7;
    }

    .xtermColor141 {
      color: #af87ff !important;
    }

    .xtermBgColor141 {
      background-color: #af87ff;
    }

    .xtermColor142 {
      color: #afaf00 !important;
    }

    .xtermBgColor142 {
      background-color: #afaf00;
    }

    .xtermColor143 {
      color: #afaf5f !important;
    }

    .xtermBgColor143 {
      background-color: #afaf5f;
    }

    .xtermColor144 {
      color: #afaf87 !important;
    }

    .xtermBgColor144 {
      background-color: #afaf87;
    }

    .xtermColor145 {
      color: #afafaf !important;
    }

    .xtermBgColor145 {
      background-color: #afafaf;
    }

    .xtermColor146 {
      color: #afafd7 !important;
    }

    .xtermBgColor146 {
      background-color: #afafd7;
    }

    .xtermColor147 {
      color: #afafff !important;
    }

    .xtermBgColor147 {
      background-color: #afafff;
    }

    .xtermColor148 {
      color: #afd700 !important;
    }

    .xtermBgColor148 {
      background-color: #afd700;
    }

    .xtermColor149 {
      color: #afd75f !important;
    }

    .xtermBgColor149 {
      background-color: #afd75f;
    }

    .xtermColor150 {
      color: #afd787 !important;
    }

    .xtermBgColor150 {
      background-color: #afd787;
    }

    .xtermColor151 {
      color: #afd7af !important;
    }

    .xtermBgColor151 {
      background-color: #afd7af;
    }

    .xtermColor152 {
      color: #afd7d7 !important;
    }

    .xtermBgColor152 {
      background-color: #afd7d7;
    }

    .xtermColor153 {
      color: #afd7ff !important;
    }

    .xtermBgColor153 {
      background-color: #afd7ff;
    }

    .xtermColor154 {
      color: #afff00 !important;
    }

    .xtermBgColor154 {
      background-color: #afff00;
    }

    .xtermColor155 {
      color: #afff5f !important;
    }

    .xtermBgColor155 {
      background-color: #afff5f;
    }

    .xtermColor156 {
      color: #afff87 !important;
    }

    .xtermBgColor156 {
      background-color: #afff87;
    }

    .xtermColor157 {
      color: #afffaf !important;
    }

    .xtermBgColor157 {
      background-color: #afffaf;
    }

    .xtermColor158 {
      color: #afffd7 !important;
    }

    .xtermBgColor158 {
      background-color: #afffd7;
    }

    .xtermColor159 {
      color: #afffff !important;
    }

    .xtermBgColor159 {
      background-color: #afffff;
    }

    .xtermColor160 {
      color: #d70000 !important;
    }

    .xtermBgColor160 {
      background-color: #d70000;
    }

    .xtermColor161 {
      color: #d7005f !important;
    }

    .xtermBgColor161 {
      background-color: #d7005f;
    }

    .xtermColor162 {
      color: #d70087 !important;
    }

    .xtermBgColor162 {
      background-color: #d70087;
    }

    .xtermColor163 {
      color: #d700af !important;
    }

    .xtermBgColor163 {
      background-color: #d700af;
    }

    .xtermColor164 {
      color: #d700d7 !important;
    }

    .xtermBgColor164 {
      background-color: #d700d7;
    }

    .xtermColor165 {
      color: #d700ff !important;
    }

    .xtermBgColor165 {
      background-color: #d700ff;
    }

    .xtermColor166 {
      color: #d75f00 !important;
    }

    .xtermBgColor166 {
      background-color: #d75f00;
    }

    .xtermColor167 {
      color: #d75f5f !important;
    }

    .xtermBgColor167 {
      background-color: #d75f5f;
    }

    .xtermColor168 {
      color: #d75f87 !important;
    }

    .xtermBgColor168 {
      background-color: #d75f87;
    }

    .xtermColor169 {
      color: #d75faf !important;
    }

    .xtermBgColor169 {
      background-color: #d75faf;
    }

    .xtermColor170 {
      color: #d75fd7 !important;
    }

    .xtermBgColor170 {
      background-color: #d75fd7;
    }

    .xtermColor171 {
      color: #d75fff !important;
    }

    .xtermBgColor171 {
      background-color: #d75fff;
    }

    .xtermColor172 {
      color: #d78700 !important;
    }

    .xtermBgColor172 {
      background-color: #d78700;
    }

    .xtermColor173 {
      color: #d7875f !important;
    }

    .xtermBgColor173 {
      background-color: #d7875f;
    }

    .xtermColor174 {
      color: #d78787 !important;
    }

    .xtermBgColor174 {
      background-color: #d78787;
    }

    .xtermColor175 {
      color: #d787af !important;
    }

    .xtermBgColor175 {
      background-color: #d787af;
    }

    .xtermColor176 {
      color: #d787d7 !important;
    }

    .xtermBgColor176 {
      background-color: #d787d7;
    }

    .xtermColor177 {
      color: #d787ff !important;
    }

    .xtermBgColor177 {
      background-color: #d787ff;
    }

    .xtermColor178 {
      color: #d7af00 !important;
    }

    .xtermBgColor178 {
      background-color: #d7af00;
    }

    .xtermColor179 {
      color: #d7af5f !important;
    }

    .xtermBgColor179 {
      background-color: #d7af5f;
    }

    .xtermColor180 {
      color: #d7af87 !important;
    }

    .xtermBgColor180 {
      background-color: #d7af87;
    }

    .xtermColor181 {
      color: #d7afaf !important;
    }

    .xtermBgColor181 {
      background-color: #d7afaf;
    }

    .xtermColor182 {
      color: #d7afd7 !important;
    }

    .xtermBgColor182 {
      background-color: #d7afd7;
    }

    .xtermColor183 {
      color: #d7afff !important;
    }

    .xtermBgColor183 {
      background-color: #d7afff;
    }

    .xtermColor184 {
      color: #d7d700 !important;
    }

    .xtermBgColor184 {
      background-color: #d7d700;
    }

    .xtermColor185 {
      color: #d7d75f !important;
    }

    .xtermBgColor185 {
      background-color: #d7d75f;
    }

    .xtermColor186 {
      color: #d7d787 !important;
    }

    .xtermBgColor186 {
      background-color: #d7d787;
    }

    .xtermColor187 {
      color: #d7d7af !important;
    }

    .xtermBgColor187 {
      background-color: #d7d7af;
    }

    .xtermColor188 {
      color: #d7d7d7 !important;
    }

    .xtermBgColor188 {
      background-color: #d7d7d7;
    }

    .xtermColor189 {
      color: #d7d7ff !important;
    }

    .xtermBgColor189 {
      background-color: #d7d7ff;
    }

    .xtermColor190 {
      color: #d7ff00 !important;
    }

    .xtermBgColor190 {
      background-color: #d7ff00;
    }

    .xtermColor191 {
      color: #d7ff5f !important;
    }

    .xtermBgColor191 {
      background-color: #d7ff5f;
    }

    .xtermColor192 {
      color: #d7ff87 !important;
    }

    .xtermBgColor192 {
      background-color: #d7ff87;
    }

    .xtermColor193 {
      color: #d7ffaf !important;
    }

    .xtermBgColor193 {
      background-color: #d7ffaf;
    }

    .xtermColor194 {
      color: #d7ffd7 !important;
    }

    .xtermBgColor194 {
      background-color: #d7ffd7;
    }

    .xtermColor195 {
      color: #d7ffff !important;
    }

    .xtermBgColor195 {
      background-color: #d7ffff;
    }

    .xtermColor196 {
      color: #ff0000 !important;
    }

    .xtermBgColor196 {
      background-color: #ff0000;
    }

    .xtermColor197 {
      color: #ff005f !important;
    }

    .xtermBgColor197 {
      background-color: #ff005f;
    }

    .xtermColor198 {
      color: #ff0087 !important;
    }

    .xtermBgColor198 {
      background-color: #ff0087;
    }

    .xtermColor199 {
      color: #ff00af !important;
    }

    .xtermBgColor199 {
      background-color: #ff00af;
    }

    .xtermColor200 {
      color: #ff00d7 !important;
    }

    .xtermBgColor200 {
      background-color: #ff00d7;
    }

    .xtermColor201 {
      color: #ff00ff !important;
    }

    .xtermBgColor201 {
      background-color: #ff00ff;
    }

    .xtermColor202 {
      color: #ff5f00 !important;
    }

    .xtermBgColor202 {
      background-color: #ff5f00;
    }

    .xtermColor203 {
      color: #ff5f5f !important;
    }

    .xtermBgColor203 {
      background-color: #ff5f5f;
    }

    .xtermColor204 {
      color: #ff5f87 !important;
    }

    .xtermBgColor204 {
      background-color: #ff5f87;
    }

    .xtermColor205 {
      color: #ff5faf !important;
    }

    .xtermBgColor205 {
      background-color: #ff5faf;
    }

    .xtermColor206 {
      color: #ff5fd7 !important;
    }

    .xtermBgColor206 {
      background-color: #ff5fd7;
    }

    .xtermColor207 {
      color: #ff5fff !important;
    }

    .xtermBgColor207 {
      background-color: #ff5fff;
    }

    .xtermColor208 {
      color: #ff8700 !important;
    }

    .xtermBgColor208 {
      background-color: #ff8700;
    }

    .xtermColor209 {
      color: #ff875f !important;
    }

    .xtermBgColor209 {
      background-color: #ff875f;
    }

    .xtermColor210 {
      color: #ff8787 !important;
    }

    .xtermBgColor210 {
      background-color: #ff8787;
    }

    .xtermColor211 {
      color: #ff87af !important;
    }

    .xtermBgColor211 {
      background-color: #ff87af;
    }

    .xtermColor212 {
      color: #ff87d7 !important;
    }

    .xtermBgColor212 {
      background-color: #ff87d7;
    }

    .xtermColor213 {
      color: #ff87ff !important;
    }

    .xtermBgColor213 {
      background-color: #ff87ff;
    }

    .xtermColor214 {
      color: #ffaf00 !important;
    }

    .xtermBgColor214 {
      background-color: #ffaf00;
    }

    .xtermColor215 {
      color: #ffaf5f !important;
    }

    .xtermBgColor215 {
      background-color: #ffaf5f;
    }

    .xtermColor216 {
      color: #ffaf87 !important;
    }

    .xtermBgColor216 {
      background-color: #ffaf87;
    }

    .xtermColor217 {
      color: #ffafaf !important;
    }

    .xtermBgColor217 {
      background-color: #ffafaf;
    }

    .xtermColor218 {
      color: #ffafd7 !important;
    }

    .xtermBgColor218 {
      background-color: #ffafd7;
    }

    .xtermColor219 {
      color: #ffafff !important;
    }

    .xtermBgColor219 {
      background-color: #ffafff;
    }

    .xtermColor220 {
      color: #ffd700 !important;
    }

    .xtermBgColor220 {
      background-color: #ffd700;
    }

    .xtermColor221 {
      color: #ffd75f !important;
    }

    .xtermBgColor221 {
      background-color: #ffd75f;
    }

    .xtermColor222 {
      color: #ffd787 !important;
    }

    .xtermBgColor222 {
      background-color: #ffd787;
    }

    .xtermColor223 {
      color: #ffd7af !important;
    }

    .xtermBgColor223 {
      background-color: #ffd7af;
    }

    .xtermColor224 {
      color: #ffd7d7 !important;
    }

    .xtermBgColor224 {
      background-color: #ffd7d7;
    }

    .xtermColor225 {
      color: #ffd7ff !important;
    }

    .xtermBgColor225 {
      background-color: #ffd7ff;
    }

    .xtermColor226 {
      color: #ffff00 !important;
    }

    .xtermBgColor226 {
      background-color: #ffff00;
    }

    .xtermColor227 {
      color: #ffff5f !important;
    }

    .xtermBgColor227 {
      background-color: #ffff5f;
    }

    .xtermColor228 {
      color: #ffff87 !important;
    }

    .xtermBgColor228 {
      background-color: #ffff87;
    }

    .xtermColor229 {
      color: #ffffaf !important;
    }

    .xtermBgColor229 {
      background-color: #ffffaf;
    }

    .xtermColor230 {
      color: #ffffd7 !important;
    }

    .xtermBgColor230 {
      background-color: #ffffd7;
    }

    .xtermColor231 {
      color: ${base07} !important;
    }

    .xtermBgColor231 {
      background-color: ${base07};
    }

    .xtermColor232 {
      color: #080808 !important;
    }

    .xtermBgColor232 {
      background-color: #080808;
    }

    .xtermColor233 {
      color: #121212 !important;
    }

    .xtermBgColor233 {
      background-color: #121212;
    }

    .xtermColor234 {
      color: #1c1c1c !important;
    }

    .xtermBgColor234 {
      background-color: #1c1c1c;
    }

    .xtermColor235 {
      color: #262626 !important;
    }

    .xtermBgColor235 {
      background-color: #262626;
    }

    .xtermColor236 {
      color: #303030 !important;
    }

    .xtermBgColor236 {
      background-color: #303030;
    }

    .xtermColor237 {
      color: #3a3a3a !important;
    }

    .xtermBgColor237 {
      background-color: #3a3a3a;
    }

    .xtermColor238 {
      color: #444444 !important;
    }

    .xtermBgColor238 {
      background-color: #444444;
    }

    .xtermColor239 {
      color: #4e4e4e !important;
    }

    .xtermBgColor239 {
      background-color: #4e4e4e;
    }

    .xtermColor240 {
      color: #585858 !important;
    }

    .xtermBgColor240 {
      background-color: #585858;
    }

    .xtermColor241 {
      color: #626262 !important;
    }

    .xtermBgColor241 {
      background-color: #626262;
    }

    .xtermColor242 {
      color: #6c6c6c !important;
    }

    .xtermBgColor242 {
      background-color: #6c6c6c;
    }

    .xtermColor243 {
      color: #767676 !important;
    }

    .xtermBgColor243 {
      background-color: #767676;
    }

    .xtermColor244 {
      color: #808080 !important;
    }

    .xtermBgColor244 {
      background-color: #808080;
    }

    .xtermColor245 {
      color: #8a8a8a !important;
    }

    .xtermBgColor245 {
      background-color: #8a8a8a;
    }

    .xtermColor246 {
      color: #949494 !important;
    }

    .xtermBgColor246 {
      background-color: #949494;
    }

    .xtermColor247 {
      color: #9e9e9e !important;
    }

    .xtermBgColor247 {
      background-color: #9e9e9e;
    }

    .xtermColor248 {
      color: #a8a8a8 !important;
    }

    .xtermBgColor248 {
      background-color: #a8a8a8;
    }

    .xtermColor249 {
      color: #b2b2b2 !important;
    }

    .xtermBgColor249 {
      background-color: #b2b2b2;
    }

    .xtermColor250 {
      color: #bcbcbc !important;
    }

    .xtermBgColor250 {
      background-color: #bcbcbc;
    }

    .xtermColor251 {
      color: #c6c6c6 !important;
    }

    .xtermBgColor251 {
      background-color: #c6c6c6;
    }

    .xtermColor252 {
      color: #d0d0d0 !important;
    }

    .xtermBgColor252 {
      background-color: #d0d0d0;
    }

    .xtermColor253 {
      color: #dadada !important;
    }

    .xtermBgColor253 {
      background-color: #dadada;
    }

    .xtermColor254 {
      color: #e4e4e4 !important;
    }

    .xtermBgColor254 {
      background-color: #e4e4e4;
    }

    .xtermColor255 {
      color: #eeeeee !important;
    }

    .xtermBgColor255 {
      background-color: #eeeeee;
    }

  '';
}
