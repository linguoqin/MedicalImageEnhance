function varargout = Wavelet(varargin)
% WAVELET MATLAB code for Wavelet.fig
%      WAVELET, by itself, creates a new WAVELET or raises the existing
%      singleton*.
%
%      H = WAVELET returns the handle to a new WAVELET or the handle to
%      the existing singleton*.
%
%      WAVELET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVELET.M with the given input arguments.
%
%      WAVELET('Property','Value',...) creates a new WAVELET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Wavelet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Wavelet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Wavelet

% Last Modified by GUIDE v2.5 11-Aug-2020 11:35:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Wavelet_OpeningFcn, ...
                   'gui_OutputFcn',  @Wavelet_OutputFcn, ...
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


% --- Executes just before Wavelet is made visible.
function Wavelet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Wavelet (see VARARGIN)

% Choose default command line output for Wavelet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Wavelet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Wavelet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_L_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_1,'String',num2str(low_freq_coef));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_1_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_2,'String',num2str(h_1));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_h_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_h_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_h_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_2_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_3,'String',num2str(h_2));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_h_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_h_2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to slider_h_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_3_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_4,'String',num2str(h_3));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_h_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_h_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_h_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_4_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_5,'String',num2str(h_4));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_h_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_h_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_h_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_h_5_Callback(hObject, eventdata, handles)
low_freq_coef = get(handles.slider_L,'Value');
h_1 =  get(handles.slider_h_1,'Value');
h_2 =  get(handles.slider_h_2,'Value');
h_3 =  get(handles.slider_h_3,'Value');
h_4 =  get(handles.slider_h_4,'Value');
h_5 =  get(handles.slider_h_5,'Value');
high_freq_coef = [h_1 h_2 h_3 h_4 h_5];
set(handles.edit_6,'String', num2str(h_5));
output = MainCall(low_freq_coef,high_freq_coef);
axes(handles.axes1);
imshow(output,[]);
% hObject    handle to slider_h_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_h_5_CreateFcn(hObject, eventdata, handles)

% hObject    handle to slider_h_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_1 as a double


% --- Executes during object creation, after setting all properties.
function edit_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_2 as text
%        str2double(get(hObject,'String')) returns contents of edit_2 as a double


% --- Executes during object creation, after setting all properties.
function edit_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_3 as text
%        str2double(get(hObject,'String')) returns contents of edit_3 as a double


% --- Executes during object creation, after setting all properties.
function edit_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_4 as text
%        str2double(get(hObject,'String')) returns contents of edit_4 as a double


% --- Executes during object creation, after setting all properties.
function edit_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_5 as text
%        str2double(get(hObject,'String')) returns contents of edit_5 as a double


% --- Executes during object creation, after setting all properties.
function edit_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_6 as text
%        str2double(get(hObject,'String')) returns contents of edit_6 as a double


% --- Executes during object creation, after setting all properties.
function edit_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
