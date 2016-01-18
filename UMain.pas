unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, Buttons, FileCtrl;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    ProgressBar1: TProgressBar;
    Edit4: TEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    OD: TOpenDialog;
    SD: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function OpenFolder(var Folder: string; OD: TOpenDialog): boolean;
begin
  Folder := OD.InitialDir;
  result := SelectDirectory('Selectionner un dossier', Folder, Folder);
end;

procedure SplitFile(FileName, SplitFileDest : TFileName; SizeofFiles : Integer; ProgressBar : TProgressBar);
var
  i : Word;
  fs, sStream: TFileStream;
  SplitFileName: String;
begin
  fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    for i := 1 to Trunc(fs.Size / SizeofFiles) + 1 do
    begin
      SplitFileName := SplitFileDest + ExtractFileName(ChangeFileExt(FileName, '.'+ FormatFloat('000', i)));
      sStream := TFileStream.Create(SplitFileName, fmCreate or fmShareExclusive);
      try
        if fs.Size - fs.Position < SizeofFiles then
          SizeofFiles := fs.Size - fs.Position;
        sStream.CopyFrom(fs, SizeofFiles);
        ProgressBar.Position := Round((fs.Position / fs.Size) * 100);
      finally
        sStream.Free;
      end;
    end;
  finally
    fs.Free;
  end;
end;

procedure CombineFiles(FileName, CombinedFileName : TFileName);
var
  i: integer;
  fs, sStream: TFileStream;
begin
  i := 1;
  fs := TFileStream.Create(CombinedFileName, fmCreate or fmShareExclusive);
  try
    while FileExists(FileName) do
    begin
      sStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
      try
        fs.CopyFrom(sStream, 0);
      finally
        sStream.Free;
      end;
      Inc(i);
      FileName := ChangeFileExt(FileName, '.'+ FormatFloat('000', i));
    end;
  finally
    fs.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ProgressBar1.Position := 0;
  SplitFile( Edit1.Text, Edit4.Text, SpinEdit1.Value * 1024, ProgressBar1);
  ProgressBar1.Position := 0;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CombineFiles(Edit2.Text, Edit3.Text);
  ShowMessage('Combining finished !!');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 if OD.Execute then
  Edit1.Text := OD.FileName;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 if OD.Execute then
  Edit2.Text := OD.FileName;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  src: string;
begin
  if OpenFolder(src, OD) then
    Edit4.Text := src;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 if SD.Execute then
  Edit3.Text := SD.FileName;
end;

end.
