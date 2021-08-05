function varargout = Home(varargin)
% HOME MATLAB code for Home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home

% Last Modified by GUIDE v2.5 07-Mar-2021 07:44:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
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


% --- Executes just before Home is made visible.
function Home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home (see VARARGIN)

% Choose default command line output for Home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 

%  I = imread(I);
% assignin('base', 'image', I);
 imshow(I)

 axes(handles.axes1);
% set(handles.pushbutton3,'Enable','on')

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)

image = getimage;


%% convert the rgb image to gray scale image 
if size(image, 3) == 3  %% CHECK IF IT IS AN RGB image ,   2 for gray scale
    image = rgb2gray(image);
end

%% conver to binary image
graythresh1 = graythresh(image);
image = ~im2bw(image, graythresh1);

%% remove the noise of the image ( remove less than 30px from the binary image)
image = bwareaopen(image,30);

%% edge detection of the image
imageEdge = edge(image);

%% dilate the image 
se = strel('square', 3);
dilatedImage = imdilate(imageEdge, se);

%% fill the hole in the image 
imageFill = imfill(dilatedImage, 'holes');

%% using bitwise and operator and the given image can take the dilated image
imageFill = imageFill & image;

%%
lower = imageFill;

 while 1
    [upper lower] = line_separator(lower);
    upper1 = upper;
    [L Ne] = bwlabel(upper1);   

%    set(handles.text4, 'String',Ne);
    
    for n=1:Ne
        [row,column] = find(L==n);
        n1=upper1(min(row):max(row),min(column):max(column));
        BW2 = bwmorph(n1,'thin',Inf);
        imrotate(BW2,0);
        z=imresize(BW2,[50 50]);
        figure(9);
        imshow(~z);
         z=feature_extract(z);
         
         load ('featureout.mat');
         featureout=z;
         save ('featureout.mat','featureout');
         test

        pause(0.5);
    end
    if isempty(lower)
         break;
     end
end
%  clear all
 winopen('output.txt');





% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
train

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myFeatureScript


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
targetY_matrix
