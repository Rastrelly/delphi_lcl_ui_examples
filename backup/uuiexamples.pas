unit uuiexamples;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, ComCtrls, ExtDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    miEdit: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miExit: TMenuItem;
    miFile: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PopupMenu1: TPopupMenu;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    Separator1: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    TrackBar1: TTrackBar;
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure miFileClick(Sender: TObject);
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure ToolButton2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin
  //CHANGE event on Edit
  if (TryStrToInt(edit1.Text,a)) then
  Label1.Caption:=inttostr(a)
  else
  Label1.Caption:='???';
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var ii:integer;
begin
  ii:=ComboBox1.ItemIndex;
  if (ii<>-1) then Label3.Caption:=inttostr(ii)+') '+ComboBox1.Items[ii]
  else  Label3.Caption:=inttostr(ii)+') '+ComboBox1.Text;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var ii:integer;
begin
  ii:=ListBox1.ItemIndex;
  if (ii<>-1) then Label2.Caption:=inttostr(ii)+') '+ListBox1.Items[ii];
end;

procedure TForm1.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  if (SaveDialog1.Execute) then
  Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.miFileClick(Sender: TObject);
begin

end;

procedure TForm1.Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[3].Text:='CurPos = '+inttostr(x)+'; '+inttostr(y);
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  MenuItem1Click(self);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  ProgressBar1.Position:=TrackBar1.Position*10;
  Label4.Caption:=inttostr(TrackBar1.Position);
end;

end.

