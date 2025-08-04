unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, RC4, XPMan, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Edit4: TEdit;
    StatusBar1: TStatusBar;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    Button5: TButton;
    Label3: TLabel;
    Button6: TButton;
    Label4: TLabel;
    Edit5: TEdit;
    Button7: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GeneratePass(syllables, numbers: Byte): string;

  function Replicate(Caracter: string; Quant: Integer): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 1 to Quant do
      Result := Result + Caracter;
  end;
const
  conso: array [0..19] of Char = ('b', 'c', 'd', 'f', 'g', 'h', 'j',
    'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z');
  vocal: array [0..4] of Char = ('a', 'e', 'i', 'o', 'u');
var
  i: Integer;
  si, sf: Longint;
  n: string;
begin
  Result := '';
  Randomize;

  if syllables <> 0 then
    for i := 1 to syllables do
    begin
      Result := Result + conso[Random(19)];
      Result := Result + vocal[Random(4)];
    end;

  if numbers = 1 then Result := Result + IntToStr(Random(9))
  else if numbers >= 2 then
  begin
    if numbers > 9 then numbers := 9;
    si     := StrToInt('1' + Replicate('0', numbers - 1));
    sf     := StrToInt(Replicate('9', numbers));
    n      := FloatToStr(si + Random(sf));
    Result := Result + Copy(n, 0,numbers);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
const
  BLOCKSIZE: Integer = 1024;
var
  RC4: TRC4Context;
  Filename: string;
  source, dest: TFileStream;
  Len: Int64;
  SourceBuffer, DestBuffer: Pointer;
begin
  Filename := Edit4.Text;
  source := TFileStream.Create(Filename, fmOpenRead);
  dest := TFileStream.Create(Filename + '.rc4', fmCreate);

  try
    GetMem(SourceBuffer, BLOCKSIZE);
    GetMem(DestBuffer, BLOCKSIZE);
    try
      RC4Init(RC4, Edit5.Text);
      Progressbar1.Max := source.Size;
      while source.Position < source.Size do
      begin
        if source.Size - source.Position > BLOCKSIZE then
          Len := BLOCKSIZE
        else
          Len := source.Size - source.Position;
        Progressbar1.Position := source.Position;
        Label2.Caption := IntToStr(source.Position) + ' bits';
        StatusBar1.SimpleText := 'Crypting please wait..';
        Progressbar1.Refresh;
        Application.ProcessMessages;
        source.ReadBuffer(SourceBuffer^, Len);
        RC4Code(RC4, SourceBuffer^, DestBuffer^, len);
        dest.WriteBuffer(DestBuffer^, Len);
      end;
      RC4Done(RC4);
    finally
      FreeMemory(SourceBuffer);
      FreeMemory(DestBuffer);
    end;
  finally
    FreeAndNil(source);
    FreeAndnIl(dest);
  end;
  MessageDlg('Crypting finish',mtInformation, [mbOK], 0);
  Edit4.Clear;
  StatusBar1.SimpleText := 'Crypting done.';  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  RC4: TRC4Context;
  s, s1: String;
begin
  s := Edit1.Text;
  setlength(s1, length(s));
  RC4Init(RC4, 'abc');
  RC4Code(RC4, s[1], s1[1], length(Edit1.Text));
  RC4Done(RC4);
  Edit2.Text := s1;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  RC4: TRC4Context;
  s, s1: String;
begin
  s := Edit2.Text;
  setlength(s1, length(s));
  RC4Init(RC4, 'abc');
  RC4Code(RC4, s[1], s1[1], length(Edit1.Text));
  RC4Done(RC4);
  Edit3.Text := s1; StatusBar1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Executables (*.EXE)|*.exe';
  OpenDialog1.FilterIndex := 1;
  if OpenDialog1.Execute then

  Edit4.Text := OpenDialog1.FileName;
  Button5.Enabled := false;  Button1.Enabled := true;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
const
  BLOCKSIZE: Integer = 1024;
var
  RC4: TRC4Context;
  Filename: string;
  source, dest: TFileStream;
  Len: Int64;
  SourceBuffer, DestBuffer: Pointer;
begin
  Filename := Edit4.Text;
  source := TFileStream.Create(Filename, fmOpenRead);
  dest := TFileStream.Create(Filename + '.rc4', fmCreate);

  try
    GetMem(SourceBuffer, BLOCKSIZE);
    GetMem(DestBuffer, BLOCKSIZE);
    try
      RC4Init(RC4, Edit5.Text);
      Progressbar1.Max := source.Size;
      while source.Position < source.Size do
      begin
        if source.Size - source.Position > BLOCKSIZE then
          Len := BLOCKSIZE
        else
          Len := source.Size - source.Position;
        Progressbar1.Position := source.Position;
        Label2.Caption := IntToStr(source.Position) + ' bits';
        StatusBar1.SimpleText := 'Crypting please wait..';
        Progressbar1.Refresh;
        Application.ProcessMessages;
        source.ReadBuffer(SourceBuffer^, Len);
        RC4Code(RC4, SourceBuffer^, DestBuffer^, len);
        dest.WriteBuffer(DestBuffer^, Len);
      end;
      RC4Done(RC4);
    finally
      FreeMemory(SourceBuffer);
      FreeMemory(DestBuffer);
    end;
  finally
    FreeAndNil(source);
    FreeAndnIl(dest);
  end;

  RenameFile(Edit4.Text+ '.rc4', Edit4.Text + '.exe');
  MessageDlg('Derypting finish',mtInformation, [mbOK], 0);
  Edit4.Clear;
  StatusBar1.SimpleText := 'Crypting done.';  StatusBar1.SetFocus;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Crypted RC4 File (*.RC4)|*.rc4';
  OpenDialog1.FilterIndex := 1;
  if OpenDialog1.Execute then Edit4.Text := OpenDialog1.FileName;
  Button1.Enabled := false; Button5.Enabled := true;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
   Edit5.Text := GeneratePass(SpinEdit1.Value, SpinEdit2.Value);
end;

end.

