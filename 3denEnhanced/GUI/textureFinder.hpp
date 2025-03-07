#define DIALOG_W 160
#define DIALOG_H 110

class ENH_TextureFinder
{
  idd = IDD_TEXTUREFINDER;
  movingEnable = true;
  onLoad = "[] spawn ENH_fnc_textureFinder_findTextures";
  class ControlsBackground
  {
    DISABLE_BACKGROUND
    class Background: ctrlStaticBackground
    {
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = DIALOG_W * GRID_W;
      h = DIALOG_H * GRID_H;
    };
    class BackgroundList: ctrlStaticFooter
    {
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = DIALOG_W * GRID_W;
      h = 52 * GRID_H;
    };
    class Header: ctrlStaticTitle
    {
      text = "$STR_ENH_TEXTUREFINDER";
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP;
      w = DIALOG_W * GRID_W;
      h = CTRL_DEFAULT_H;
    };
    class Footer: ctrlStaticFooter
    {
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP + 108 * GRID_H;
      w = DIALOG_W * GRID_W;
      h = CTRL_DEFAULT_H + 2 * GRID_H;
    };
  };
  class Controls
  {
    class TextureList: ctrlTree
    {
      idc = IDC_TEXTUREFINDER_TEXTURELIST;
      idcSearch = 1600;
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP + CTRL_DEFAULT_H;
      w = DIALOG_W * GRID_W;
      h = 52 * GRID_H;
      colorBorder[] = {0, 0, 0, 0};
      colorLines[] = {1, 1, 1, 1};
    };
    class ProgessText: ctrlStructuredText
    {
      idc = IDC_TEXTUREFINDER_PROGRESSTEXT;
      style = ST_LEFT;
      x = CENTERED_X(DIALOG_W) + 36 * GRID_W;
      y = DIALOG_TOP + 109 * GRID_H;
      w = 80 * GRID_W;
      h = CTRL_DEFAULT_H;
    };
    class Preview: ctrlStaticPictureKeepAspect
    {
      idc = IDC_TEXTUREFINDER_PREVIEW;
      x = CENTERED_X(DIALOG_W);
      y = DIALOG_TOP + 58 * GRID_H;
      w = DIALOG_W * GRID_W;
      h = 40 * GRID_H;
      colorBackground[] = {1, 1, 1, 1};
    };
    class Search: ctrlEdit
    {
      idc = IDC_TEXTUREFINDER_SEARCH;
      x = CENTERED_X(DIALOG_W) + 1 * GRID_W;
      y = DIALOG_TOP + 109 * GRID_H;
      w = 30 * GRID_W;
      h = CTRL_DEFAULT_H;
      tooltip = __EVAL(format ["%1+%2", toUpper localize "STR_DIK_CONTROL", "F"]);
    };
    class SearchIcon: ctrlStaticPictureKeepAspect
    {
      text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
      x = CENTERED_X(DIALOG_W) + 31 * GRID_W;
      y = DIALOG_TOP + 109 * GRID_H;
      w = 5 * GRID_W;
      h = 5 * GRID_H;
    };
    class Close: ctrlButtonClose
    {
      x = CENTERED_X(DIALOG_W) + 129 * GRID_W;
      y = DIALOG_TOP + 109 * GRID_H;
      w = 30 * GRID_W;
      h = CTRL_DEFAULT_H;
    };
  };
};