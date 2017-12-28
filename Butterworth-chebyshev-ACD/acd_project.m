function varargout = acd_project(varargin)
% ACD_PROJECT MATLAB code for acd_project.fig
%      ACD_PROJECT, by itself, creates a new ACD_PROJECT or raises the existing
%      singleton*.
%
%      H = ACD_PROJECT returns the handle to a new ACD_PROJECT or the handle to
%      the existing singleton*.
%
%      ACD_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACD_PROJECT.M with the given input arguments.
%
%      ACD_PROJECT('Property','Value',...) creates a new ACD_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acd_project_OpeningFcn gets called.  An
%      unrecognized property nd to acd_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acd_project

% Last Modified by GUIDE v2.5 25-Oct-2015 23:45:59
%      stop.  All inputs are passe

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acd_project_OpeningFcn, ...
                   'gui_OutputFcn',  @acd_project_OutputFcn, ...
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





% --- Executes just before acd_project is made visible.
function acd_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acd_project (see VARARGIN)

% Choose default command line output for acd_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acd_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = acd_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function as_Callback(hObject, eventdata, handles)
% hObject    handle to as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of as as text
%        str2double(get(hObject,'String')) returns contents of as as a double



% --- Executes during object creation, after setting all properties.
function as_CreateFcn(hObject, eventdata, handles)
% hObject    handle to as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function os_Callback(hObject, eventdata, handles)
% hObject    handle to os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of os as text
%        str2double(get(hObject,'String')) returns contents of os as a double


% --- Executes during object creation, after setting all properties.
function os_CreateFcn(hObject, eventdata, handles)
% hObject    handle to os (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ap_Callback(hObject, eventdata, handles)
% hObject    handle to ap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ap as text
%        str2double(get(hObject,'String')) returns contents of ap as a double



% --- Executes during object creation, after setting all properties.
function ap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function op_Callback(hObject, eventdata, handles)
% hObject    handle to op (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of op as text
%        str2double(get(hObject,'String')) returns contents of op as a double



% --- Executes during object creation, after setting all properties.
function op_CreateFcn(hObject, eventdata, handles)
% hObject    handle to op (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
atst=0;atps=0;frst=0;frps=0;frex=0;
tog=get(handles.fz,'value');

   
str=get(handles.as,'string');
s=str2double(str);
atst=s;
str=get(handles.op,'string');
s=str2double(str);
frps=s;
str=get(handles.ap,'string');
s=str2double(str);
atps=s;
str=get(handles.os,'string');
s=str2double(str);
frst=s;
if tog==1
    frst=2*pi*frst;
    frps=2*pi*frps;
end
frex=0:.1:frst+100;
[ chomc, chle, chep, chN, chTF ] = chf( frst,frps,atst,atps );
[ btomc, btle, btep, btN, btTF ] = btf( frst,frps,atst,atps );
t=num2str(btle);
set(handles.lem,'string',t);
t=num2str(btep);
set(handles.eps,'string',t);
t=num2str(btomc);
set(handles.oc,'string',t);
t=num2str(btN);
set(handles.btorder,'string',t);
t=num2str(chN);
set(handles.chorder,'string',t);

t=char((btTF));
set(handles.bttf,'string',t);
t=char(abs(btTF));
%t=mag2db(abs(btTF));
axes(handles.plot1);hold on
ez1=ezplot((t),[0,frst+100]);
ez2=stem(frst,db2mag(atst),'--g');
ez3=stem(frps,db2mag(atps),'--g');
hold off
title('butterworth filter');ylabel('magnitude');
if tog==0
    xlabel('frequency  (rad/sec)');
else
    xlabel('frequency  (hz)');
end


t=char((chTF));
set(handles.chtf,'string',t);t=char(abs(chTF));
axes(handles.plot2);hold on
ez4=ezplot((t),[0,frst+100]);
ez5=stem(frst,db2mag(atst),'--g');
ez6=stem(frps,db2mag(atps),'--g');
hold off
title('chebyshev I filter');ylabel('magnitude');
if tog==0
    xlabel('frequency  (rad/sec)');
else
    xlabel('frequency  (hz)');
end



% --- Executes on button press in fz.
function fz_Callback(hObject, eventdata, handles)
% hObject    handle to fz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fz





% --- Executes on button press in repeat.
function repeat_Callback(hObject, eventdata, handles)
% hObject    handle to repeat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla (handles.plot2);
cla(handles.plot1);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
