function varargout = thesis1(varargin)
% THESIS1 MATLAB code for thesis1.fig
%      THESIS1, by itself, creates a new THESIS1 or raises the existing
%      singleton*.
%
%      H = THESIS1 returns the handle to a new THESIS1 or the handle to
%      the existing singleton*.
%
%      THESIS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THESIS1.M with the given input arguments.
%
%      THESIS1('Property','Value',...) creates a new THESIS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thesis1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thesis1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thesis1

% Last Modified by GUIDE v2.5 24-Jul-2019 17:45:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thesis1_OpeningFcn, ...
                   'gui_OutputFcn',  @thesis1_OutputFcn, ...
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


% --- Executes just before thesis1 is made visible.
function thesis1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thesis1 (see VARARGIN)

% Choose default command line output for thesis1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thesis1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thesis1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global cam;
%cam = webcam;
%frame = snapshot(cam);
%im = image(app.UIAxes, zeros(size(frame), 'uint8'));
%axis(app.UIAxes, 'image');
%preview(cam,im);
%pause;
clc
status = 0; 
camera = webcam; 
nnet = alexnet;
myImage = imread('x.png');
myImage1 = imread('c.png');
%     if status == 0
%     set(gca, 'visible', 'on')
%     imshow(myImage);
%     axes(handles.axes3);
%     else 
%     set(gca, 'visible', 'on')
%     imshow(myImage1);
%     axes(handles.axes3);    
%     end
while true
    picture = camera.snapshot;
    picture = imresize(picture, [227,227]);
    
    label = classify(nnet, picture);
   
    image(picture);
     if label == 'banana'
     title(char('YES'), 'Color', 'green');
%       axes(handles.axes1);
%        drawnow;
%        status = 1;
   else
       title(char('NO'), 'Color', 'red');
%        set(findobj(gcf, 'type','axes1'), 'Visible','on')
%        axes(handles.axes3);
%        imshow(myImage);
%         hold(axes3,'on');
%        set(handles.axes3, 'Units', 'normalized');
       drawnow;
% %        axes(handles.axes3);
%            status = 0;
    end
end
    
% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes during object creation, after setting all properties.


function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear all; close all; clc;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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
