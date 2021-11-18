% A MATLAB GUI where the user can load an image, use the RGB sliders to
% adjust the filters of the image, and then export it.

function varargout = RGB_FilterGUI(varargin)
% RGB_FILTERGUI MATLAB code for RGB_FilterGUI.fig
%      RGB_FILTERGUI, by itself, creates a new RGB_FILTERGUI or raises the existing
%      singleton*.
%
%      H = RGB_FILTERGUI returns the handle to a new RGB_FILTERGUI or the handle to
%      the existing singleton*.
%
%      RGB_FILTERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB_FILTERGUI.M with the given input arguments.
%
%      RGB_FILTERGUI('Property','Value',...) creates a new RGB_FILTERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RGB_FilterGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RGB_FilterGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RGB_FilterGUI

% Last Modified by GUIDE v2.5 10-Jun-2021 16:18:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RGB_FilterGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RGB_FilterGUI_OutputFcn, ...
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


% --- Executes just before RGB_FilterGUI is made visible.
function RGB_FilterGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RGB_FilterGUI (see VARARGIN)

% Choose default command line output for RGB_FilterGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RGB_FilterGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RGB_FilterGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in loadOriginal.
function loadOriginal_Callback(hObject, eventdata, handles)
% hObject    handle to loadOriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global array;
global statusR;
global statusG;
global statusB;
statusR = 1;
statusG = 1;
statusB = 1;
disp("Loading Image... ");
% Gets user input of the directory location and file name
[fileName, Path] = uigetfile();
% In case the user decides not to choose a file
if (Path == 0)
    disp("Loading Canceled")
    return;
end
fileFullName = fullfile(Path, fileName);
% Converts values to double precision
array = im2double(imread(fileFullName));
% Plots the original and copy of the original that will later be filtered
imshow(array, 'Parent', handles.axes1);
imshow(array, 'Parent', handles.axes2);
disp("Image Loaded");

% --- Executes on slider movement.
function sliderR_Callback(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global array;
global statusR;
global statusG;
global statusB;
% Gets the value of the R-slider
statusR = get(hObject, 'Value');
temp = array;
% Applies the values of the RGB filters onto the array
temp(:, :, 1) = array(:,:,1).*statusR;
temp(:, :, 2) = array(:,:,2).*statusG;
temp(:, :, 3) = array(:,:,3).*statusB;
% Update edited image
imshow(temp, 'Parent', handles.axes2);
% Update the static text next to the slider
set(handles.textR, 'String', num2str(statusR));

% --- Executes during object creation, after setting all properties.
function sliderR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderG_Callback(hObject, eventdata, handles)
% hObject    handle to sliderG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global array;
global statusR;
global statusG;
global statusB;
statusG = get(hObject, 'Value');
temp = array;
temp(:, :, 1) = array(:,:,1).*statusR;
temp(:, :, 2) = array(:,:,2).*statusG;
temp(:, :, 3) = array(:,:,3).*statusB;
imshow(temp, 'Parent', handles.axes2);
set(handles.textG, 'String', num2str(statusG));

% --- Executes during object creation, after setting all properties.
function sliderG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderB_Callback(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global array;
global statusR;
global statusG;
global statusB;
statusB = get(hObject, 'Value');
temp = array;
temp(:, :, 1) = array(:,:,1).*statusR;
temp(:, :, 2) = array(:,:,2).*statusG;
temp(:, :, 3) = array(:,:,3).*statusB;
imshow(temp, 'Parent', handles.axes2);
set(handles.textB, 'String', num2str(statusB))

% --- Executes during object creation, after setting all properties.
function sliderB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in exportImg.
function exportImg_Callback(hObject, eventdata, handles)
% hObject    handle to exportImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename
global array;
global statusR;
global statusG;
global statusB;
% Obtains the directory's path of where the user wants the image to be
% saved at
path = uigetdir('Documents');
temp = array;
temp(:, :, 1) = array(:,:,1).*statusR;
temp(:, :, 2) = array(:,:,2).*statusG;
temp(:, :, 3) = array(:,:,3).*statusB;
Exported = figure;
imshow(temp);
% Obtain the desired file name from the User's textbox
fileFullName = string(fullfile(path, filename));
hgsave(Exported, fileFullName);


% IF the file name is set to default, it will create an Images.fig where
% the script is located
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global filename;
% Get the user's desired file name
filename = get(hObject, 'String');
if (filename == null)
    return;
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
