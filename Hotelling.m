function varargout = Hotelling(varargin)
% HOTELLING MATLAB code for Hotelling.fig
%      HOTELLING, by itself, creates a new HOTELLING or raises the existing
%      singleton*.
%
%      H = HOTELLING returns the handle to a new HOTELLING or the handle to
%      the existing singleton*.
%
%      HOTELLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOTELLING.M with the given input arguments.
%
%      HOTELLING('Property','Value',...) creates a new HOTELLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hotelling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hotelling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hotelling

% Last Modified by GUIDE v2.5 09-Oct-2021 08:32:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hotelling_OpeningFcn, ...
                   'gui_OutputFcn',  @Hotelling_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Hotelling is made visible.
function Hotelling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hotelling (see VARARGIN)

% Choose default command line output for Hotelling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hotelling wait for user response (see UIRESUME)
% uiwait(handles.figure1);
hback = axes('units','normalized','position',[0 0 1 1]);
uistack(hback,'bottom'); % menciptakan axes untuk tempat menampilkan gambar
% menampilkan background
[back map]=imread('7.jpg');
image(back)
colormap(map)
background=imread('7.jpg');
% set(handles.pan1,'CData',background);
% handlevisibility off agar axes tidak terlihat
% dan gambar background saja yang muncul.
set(hback,'handlevisibility','off','visible','off')
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Hotelling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_hitung.
function pushbutton_hitung_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_hitung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.edit_a,'String'));
b=str2num(get(handles.edit_b,'String'));
c=str2num(get(handles.edit_c,'String'));
n=str2num(get(handles.edit_n,'String'));
Ftabel=str2num(get(handles.edit_Ftabel,'String'));
miu=[a;b;c];
B='Userdata';
p=3;
x1=B(:,1);
x2=B(:,2);
x3=B(:,3);
xbar=[mean(x1);mean(x2);mean(x3)];
A=xbar-miu;
S=cov('Userdata');
Thotelling=n*(A')*(inv(S))*A;
csqr=(((n-1)*p)/(n-p))*(Ftabel)
if Thotelling<csqr
    set(handles.edit_thot,'String',Thotelling,'fontsize',10);
    set(handles.edit_c2,'String',csqr,'fontsize',10);
    set(handles.edit_keputusan,'String','H0 diterima','fontsize',10);
    set(handles.edit_kesimpulan,'String','Ada perbedaan antara vektor mean (1) dengan vektor mean(0)','fontsize',11);
else
    set(handles.edit_thot,'String',Thotelling,'fontsize',10);
    set(handles.edit_c2,'String',csqr,'fontsize',10);
    set(handles.edit_keputusan,'String','H0 ditolak','fontsize',10);
    set(handles.edit_kesimpulan,'String','Tidak ada perbedaan antara vektor mean (1) dengan vektor mean(0)','fontsize',11);
end

% --- Executes on button press in pushbutton_edit.
function pushbutton_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_a,'String','');
set(handles.edit_b,'String','');
set(handles.edit_c,'String','');
set(handles.edit_n,'String','');
set(handles.edit_Ftabel,'String','');
set(handles.edit_cari,'String','');
set(handles.edit_thot,'String','');
set(handles.edit_c2,'String','');
set(handles.edit_keputusan,'String','');
set(handles.edit_kesimpulan,'String','');

% --- Executes on button press in pushbutton_tutup.
function pushbutton_tutup_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tutup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


function edit_kesimpulan_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kesimpulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kesimpulan as text
%        str2double(get(hObject,'String')) returns contents of edit_kesimpulan as a double


% --- Executes during object creation, after setting all properties.
function edit_kesimpulan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_kesimpulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_thot_Callback(hObject, eventdata, handles)
% hObject    handle to edit_thot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_thot as text
%        str2double(get(hObject,'String')) returns contents of edit_thot as a double


% --- Executes during object creation, after setting all properties.
function edit_thot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_thot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_c2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c2 as text
%        str2double(get(hObject,'String')) returns contents of edit_c2 as a double


% --- Executes during object creation, after setting all properties.
function edit_c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_keputusan_Callback(hObject, eventdata, handles)
% hObject    handle to edit_keputusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_keputusan as text
%        str2double(get(hObject,'String')) returns contents of edit_keputusan as a double


% --- Executes during object creation, after setting all properties.
function edit_keputusan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_keputusan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_n_Callback(hObject, eventdata, handles)
% hObject    handle to edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_n as text
%        str2double(get(hObject,'String')) returns contents of edit_n as a double


% --- Executes during object creation, after setting all properties.
function edit_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ftabel_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ftabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ftabel as text
%        str2double(get(hObject,'String')) returns contents of edit_Ftabel as a double


% --- Executes during object creation, after setting all properties.
function edit_Ftabel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ftabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_a_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a as text
%        str2double(get(hObject,'String')) returns contents of edit_a as a double


% --- Executes during object creation, after setting all properties.
function edit_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_b_Callback(hObject, eventdata, handles)
% hObject    handle to edit_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_b as text
%        str2double(get(hObject,'String')) returns contents of edit_b as a double


% --- Executes during object creation, after setting all properties.
function edit_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_c_Callback(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_c as text
%        str2double(get(hObject,'String')) returns contents of edit_c as a double


% --- Executes during object creation, after setting all properties.
function edit_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_cari_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cari (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cari as text
%        str2double(get(hObject,'String')) returns contents of edit_cari as a double


% --- Executes during object creation, after setting all properties.
function edit_cari_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cari (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_cari.
function pushbutton_cari_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cari (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namafile,direktori]=uigetfile('*.xlsx');
alamatfile=fullfile(direktori,namafile);
set(handles.edit_cari,'String','alamatfile');

[a b c]=xlsread(alamatfile);
bar=size(c,1);
col=size(c,3);

judul=c(1,3:col);
data=c(2:bar,2:col);

num=linspace(1,bar-1,bar-1);
set(handles.uitable2,'data',c,'ColumnName',judul,'RowName',num);
set(handles.uitable2,'Userdata',c);
B='Userdata'

myicon(:,:,1)=[0 1; 0 1];
myicon(:,:,2)=[0 1; 0 1];
myicon(:,:,3)=[0 1; 0 1];

h=msgbox('sukses Import','Sukses','Custom',myicon);



function edit_p_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p as text
%        str2double(get(hObject,'String')) returns contents of edit_p as a double


% --- Executes during object creation, after setting all properties.
function edit_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
