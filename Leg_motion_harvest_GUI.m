function varargout = Leg_motion_harvest_GUI(varargin)
% LEG_MOTION_HARVEST_GUI MATLAB code for Leg_motion_harvest_GUI.fig
%      LEG_MOTION_HARVEST_GUI, by itself, creates a new LEG_MOTION_HARVEST_GUI or raises the existing
%      singleton*.
%
%      H = LEG_MOTION_HARVEST_GUI returns the handle to a new LEG_MOTION_HARVEST_GUI or the handle to
%      the existing singleton*.
%
%      LEG_MOTION_HARVEST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEG_MOTION_HARVEST_GUI.M with the given input arguments.
%
%      LEG_MOTION_HARVEST_GUI('Property','Value',...) creates a new LEG_MOTION_HARVEST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Leg_motion_harvest_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Leg_motion_harvest_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Leg_motion_harvest_GUI

% Last Modified by GUIDE v2.5 24-Jan-2018 16:22:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Leg_motion_harvest_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Leg_motion_harvest_GUI_OutputFcn, ...
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


% --- Executes just before Leg_motion_harvest_GUI is made visible.
function Leg_motion_harvest_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
global fs fc current_data axis data_type
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Leg_motion_harvest_GUI (see VARARGIN)

% load 'HumanMotion_LowerLeg.mat'
% handles.slow_walk = HumanMotion_LowerLeg(46000:300001,5:7);
% handles.normal_walk = HumanMotion_LowerLeg(345000:655001,5:7);
% handles.jogging = HumanMotion_LowerLeg(675900:911001,5:7);
% 
% 
% fs = 2048;
fc = 0.10;



fs = 128;
%first record has different timings than others as treadmill screwed up
% load 'leg_data_resampled.mat'
% handles.slow_walk = leg_data_resampled(10240:20480,5:7);
% handles.normal_walk = leg_data_resampled(25601:35840,5:7);
% handles.jogging = leg_data_resampled(39681:44800,5:7);

% load 'foot_data_resampled.mat'
% handles.slow_walk = foot_data_resampled(10240:20480,5:7);
% handles.normal_walk = foot_data_resampled(25601:35840,5:7);
% handles.jogging = foot_data_resampled(39681:44800,5:7);

% load 'leg_data_resampled2.mat'
% handles.slow_walk = leg_data_resampled2(1280:14080,5:7); %chops 10s off either side. So look from 10s - 110s
% handles.normal_walk = leg_data_resampled2(16640:29440,5:7); %130s - 230s
% handles.jogging = leg_data_resampled2(32000:44800,5:7); %250s - 350s

% load 'foot_data_resampled2.mat'
% handles.slow_walk = foot_data_resampled2(1280:14080,5:7);
% handles.normal_walk = foot_data_resampled2(16640:29440,5:7);
% handles.jogging = foot_data_resampled2(32000:44800,5:7);

% load 'leg_data_resampled3.mat'
% handles.slow_walk = leg_data_resampled3(1280:14080,5:7); %chops 10s off either side. So look from 10s - 110s
% handles.normal_walk = leg_data_resampled3(16640:29440,5:7); %130s - 230s
% handles.jogging = leg_data_resampled3(32000:44800,5:7); %250s - 350s

% load 'foot_data_resampled3.mat'
% handles.slow_walk = foot_data_resampled3(1280:14080,5:7);
% handles.normal_walk = foot_data_resampled3(16640:29440,5:7);
% handles.jogging = foot_data_resampled3(32000:44800,5:7);

% load 'leg_data_resampled4.mat'
% handles.slow_walk = leg_data_resampled4(1280:14080,5:7); %chops 10s off either side. So look from 10s - 110s
% handles.normal_walk = leg_data_resampled4(16640:29440,5:7); %130s - 230s
% handles.jogging = leg_data_resampled4(32000:44800,5:7); %250s - 350s

% load 'foot_data_resampled4.mat'
% handles.slow_walk = foot_data_resampled4(1280:14080,5:7);
% handles.normal_walk = foot_data_resampled4(16640:29440,5:7);
% handles.jogging = foot_data_resampled4(32000:44800,5:7);

load 'leg_data_resampled5.mat'
handles.slow_walk = leg_data_resampled5(1280:14080,5:7); %chops 10s off either side. So look from 10s - 110s
handles.normal_walk = leg_data_resampled5(16640:29440,5:7); %130s - 230s
handles.jogging = leg_data_resampled5(32000:44800,5:7); %250s - 350s
% % 
% load 'foot_data_resampled5.mat'
% handles.slow_walk = foot_data_resampled5(1280:14080,5:7);
% handles.normal_walk = foot_data_resampled5(16640:29440,5:7);
% handles.jogging = foot_data_resampled5(32000:44800,5:7);


current_data = handles.slow_walk;
data_type = 1;
axis = 0;


% Choose default command line output for Leg_motion_harvest_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Leg_motion_harvest_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Leg_motion_harvest_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_l_Callback(hObject, eventdata, handles)
% hObject    handle to Z_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z_l as text
%        str2double(get(hObject,'String')) returns contents of Z_l as a double


% --- Executes during object creation, after setting all properties.
function Z_l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_inputdata.
function popupmenu_inputdata_Callback(hObject, eventdata, handles)
global current_data fs data_type
% hObject    handle to popupmenu_inputdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



sine_data = create_sine(hObject, eventdata, handles);

str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'Slow Walk'
        current_data = handles.slow_walk;
        data_type = 1;
    case 'Normal Walk'
        current_data = handles.normal_walk;
        data_type = 2;
    case 'Jogging'
        current_data = handles.jogging;
        data_type = 3';
    case 'Sine Wave'
        current_data = sine_data;
        data_type = 4;
end

function [sine_data] = create_sine(hObject, eventdata, handles)
global Fs current_data
frequency = str2double(get(handles.edit_sinefreq, 'String'));
amplitude = str2double(get(handles.edit_sineamp, 'String'));;
   Fs = str2double(get(handles.edit_samplerate, 'String'));;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = str2double(get(handles.edit_sinelength, 'String'));;             % seconds
   t = (0:dt:StopTime-dt);     % seconds
   %% Sine wave:                    % hertz
   xvalues = amplitude*sin(2*pi*frequency*t);
   yvalues = t;

a = xvalues.';
time = yvalues.';

sine_data = [a, a.*0, a.*0];
current_data = sine_data;



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_inputdata contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_inputdata


% --- Executes during object creation, after setting all properties.
function popupmenu_inputdata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_inputdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text8.
function text8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function efficiency_Callback(hObject, eventdata, handles)
% hObject    handle to efficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of efficiency as text
%        str2double(get(hObject,'String')) returns contents of efficiency as a double


% --- Executes during object creation, after setting all properties.
function efficiency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to efficiency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UpdateButton.
function UpdateButton_Callback(hObject, eventdata, handles)
global m k b Z_l efficiency time current_data filtorder fc fs a_filtered displacement axis data_type P energy x_filtered y_filtered z_filtered
% hObject    handle to UpdateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Check to see if input data is sine wave, to see if parameters need
%updating
if (data_type == 4)
    create_sine(hObject, eventdata, handles);
end

%Get filter parameters
fs = str2double(get(handles.edit_samplerate, 'String'));
filtorder = str2double(get(handles.edit_filtorder, 'String'));
fc = str2double(get(handles.edit_filtcutoff, 'String'));

%Get the harvester parameters from text entries
m = (str2double(get(handles.m,'String'))/1e3);
k = str2double(get(handles.k,'String'));
b = str2double(get(handles.b,'String'));
Z_l = (str2double(get(handles.Z_l,'String')))/1e3;
efficiency = (str2double(get(handles.efficiency,'String')))/100;

Q = sqrt(k*m)/b;    %Harvester quality factor (spectral width) (Hz?)
f_r = sqrt(k/m)/(2*pi);    %harvester resonant frequency (Hz)

set(handles.Q, 'String', num2str(Q));   %Update display of Q
set(handles.f_r, 'String', num2str(f_r));   %Update display of f_r

x = current_data(:,1);
y = current_data(:,2);
z = current_data(:,3);
time = 0:1/fs:((1/fs)*(length(current_data)-1));
time = time.';

if (data_type ~= 4)
    [x_filtered, y_filtered, z_filtered] = filter_data(x, y, z);
else
    x_filtered = x;
    y_filtered = y;
    z_filtered = z;
end



axes(handles.input_plot);   %Bring focus to input data plot
hold off
plot(time,x_filtered, 'LineWidth',2);
hold on
plot(time,y_filtered, 'LineWidth',2);
plot(time,z_filtered, 'LineWidth',2);
%xlim([0 150]);
% xlim([75.5 80])
title('\bf Filtered Acceleration');xlabel('Time (s)');ylabel(' Acceleration (g)')
legend('x', 'y', 'z')






switch axis
    case 0
        a_filtered = x_filtered;
        a = x;
    case 1
        a_filtered = y_filtered;
        a = y;
    case 2
        a_filtered = z_filtered;
        a = z;
    case 3
        a_filtered = sqrt(x_filtered.^2 + y_filtered.^2 + z_filtered.^2);
        a = sqrt(x.^2 + y.^2 + z.^2);
end

FFTdata(a, a_filtered, handles);
%Simulinkmodel(a_filtered, time, handles);


simin=[time, a_filtered];

sim('Harvester_model');
P = [simout.time, simout.data];
%mass_displacement = [displacement.time, displacement.data];
axes(handles.mass_displacement);%Bring focus to mass displacement plot
plot(displacement.time,(displacement.data)*1e3, 'LineWidth',2);

% xlim([75.5 80]);

title('\bf Proof Mass Displacement');xlabel('Time (s)');ylabel('Displacement (mm)')

ylimit = (str2double(get(handles.Z_l, 'String')) / 2) + 1;
ylim([-ylimit ylimit])


axes(handles.output_power);
plot(P(:,1), P(:,2).*1e6, 'LineWidth',2);
%plot(simout.time, simout.data.*1e6);
title('\bf Harvestable Power');xlabel('Time (s)');ylabel('Power (\muW)')

legend('off')

energy = energy.data;
total_energy = energy(end);
set(handles.text_totalenergy, 'String', num2str(total_energy*1e3))

avg_power = total_energy/time(end);
set(handles.text_avgpower, 'String', num2str(avg_power*1e6))

set(handles.text_interval1, 'String', num2str(0))
set(handles.text_interval2, 'String', num2str(0))
set(handles.text_interval3, 'String', num2str(0))
set(handles.text_interval4, 'String', num2str(0))
set(handles.text_interval5, 'String', num2str(0))
set(handles.text_interval6, 'String', num2str(0))
set(handles.text_interval7, 'String', num2str(0))
set(handles.text_interval8, 'String', num2str(0))

total_intervals = floor((time(end) + 1/fs)/5);

% powers = zeros(floor(time(end)/5));
for n = 1:total_intervals %repeat for loop for the number of 5 second intervals in the sample
    interval(n) = (n*5)/(1/fs); %time sample for interval
    if n~=1
        powers(n) = (energy(interval(n)) - energy(interval(n-1)))/5;
    else
        powers(n) = energy(interval(n))/5;
    end
end

for n = 1:total_intervals
    if n == 1
        set(handles.text_interval1, 'String', num2str(powers(1)*1e6))
    elseif n == 2
        set(handles.text_interval2, 'String', num2str(powers(2)*1e6))
    elseif n == 3
        set(handles.text_interval3, 'String', num2str(powers(3)*1e6))
    elseif n == 4
        set(handles.text_interval4, 'String', num2str(powers(4)*1e6))
    elseif n == 5
        set(handles.text_interval5, 'String', num2str(powers(5)*1e6))
    elseif n == 6
        set(handles.text_interval6, 'String', num2str(powers(6)*1e6))
    elseif n == 7
        set(handles.text_interval7, 'String', num2str(powers(7)*1e6))
    elseif n == 8
        set(handles.text_interval8, 'String', num2str(powers(8)*1e6))        
    end
end











function [x_filtered, y_filtered, z_filtered] = filter_data(x, y, z)
global fc fs
[bn,an] = butter(3,fc/(fs/2),'high');
x_filtered = filter(bn,an,x);
y_filtered = filter(bn,an,y);
z_filtered = filter(bn,an,z);


function [] = FFTdata(a, a_filtered, handles)
global fs dominant_frequency P1_A_filtered f
A = fft(a);
A_filtered = fft(a_filtered);

L = length(a);

P2_A = abs(A/L);
P2_A_filtered = abs(A_filtered/L);

P1_A = P2_A(1:L/2+1);
P1_A_filtered = P2_A_filtered(1:L/2+1);

P1_A(2:end-1) = 2*P1_A(2:end-1);
P1_A_filtered(2:end-1) = 2*P1_A_filtered(2:end-1);

f = fs*(0:(L/2))/L;

[M,I] = max(P1_A_filtered); %find largest peak in FFT and array element where it occurs
dominant_frequency = f(I);   %find at what frequency the largest peak is at
set(handles.text_dommag, 'String', num2str(M));
set(handles.text_domfreq, 'String', dominant_frequency);

axes(handles.input_FFT);   %Bring focus to FFT data plot
hold off
plot(f,P1_A, 'LineWidth', 2);
hold on
plot(f,P1_A_filtered, 'LineWidth', 2);
title('\bf FFT of acceleration');xlabel('Frequency (Hz)');ylabel('Magnitude (g)')
legend('Unfiltered', 'Filtered');
xlim([0 40])






%function [] = Simulinkmodel(a_filtered, time, handles)




function edit_filtorder_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filtorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filtorder as text
%        str2double(get(hObject,'String')) returns contents of edit_filtorder as a double


% --- Executes during object creation, after setting all properties.
function edit_filtorder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filtorder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_filtcutoff_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filtcutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filtcutoff as text
%        str2double(get(hObject,'String')) returns contents of edit_filtcutoff as a double


% --- Executes during object creation, after setting all properties.
function edit_filtcutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filtcutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_samplerate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_samplerate as text
%        str2double(get(hObject,'String')) returns contents of edit_samplerate as a double


% --- Executes during object creation, after setting all properties.
function edit_samplerate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sinefreq_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sinefreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sinefreq as text
%        str2double(get(hObject,'String')) returns contents of edit_sinefreq as a double


% --- Executes during object creation, after setting all properties.
function edit_sinefreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sinefreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sineamp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sineamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sineamp as text
%        str2double(get(hObject,'String')) returns contents of edit_sineamp as a double


% --- Executes during object creation, after setting all properties.
function edit_sineamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sineamp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sinelength_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sinelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sinelength as text
%        str2double(get(hObject,'String')) returns contents of edit_sinelength as a double


% --- Executes during object creation, after setting all properties.
function edit_sinelength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sinelength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
global axis
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'x'
        axis = 0;
    case 'y'
        axis = 1;
    case 'z'
        axis = 2;
    case 'magnitude'
        axis = 3;
end


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val}
    case 'H1 (Gorlatova et al.)'
        set(handles.m, 'String', num2str(1));
        set(handles.k, 'String', num2str(0.17));
        set(handles.b, 'String', num2str(0.0055));
        set(handles.Z_l, 'String', num2str(10));
    case 'H2 (Gorlatova et al.)'
        set(handles.m, 'String', num2str(1));
        set(handles.k, 'String', num2str(0.30));
        set(handles.b, 'String', num2str(0.0045));
        set(handles.Z_l, 'String', num2str(10));
    case 'Foot Harvester, Jogging'
        set(handles.m, 'String', num2str(2.48));
        set(handles.k, 'String', num2str(0.17));
        set(handles.b, 'String', num2str(0.0005));
        set(handles.Z_l, 'String', num2str(100));
end
       

% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text_interval1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_interval2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text_interval2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_interval2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = (str2double(get(handles.m,'String'))/1e3); %Get current value of m
dom_freq = str2double(get(handles.text_domfreq, 'String')); %Get dominant frequency of input signal

k = ((2*pi*dom_freq)^2)*m;  %Find required k value to make resonsant frequency of harvester match input signal
set(handles.k, 'String', num2str(k));   %Update field with this value of k


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global P widths proms pks dominant_frequency locs m n fs peak_dimensions energy peak_widths avg_peak_powers
clear peak_dimensions peak_widths avg_peak_powers pks avg_peak_width
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.output_power);
xl = xlim;
yl = ylim;



[pks,locs,widths,proms] = findpeaks(P(:,2).*1e6,P(:,1));
findpeaks(P(:,2).*1e6,P(:,1),'Annotate','extents','MinPeakHeight',mean(pks)/2,'MinPeakDistance',(1/dominant_frequency)/2.3);
[pks,locs,widths,proms] = findpeaks(P(:,2).*1e6,P(:,1),'Annotate','extents','MinPeakHeight',mean(pks)/2,'MinPeakDistance',(1/dominant_frequency)/2.3);
legend('off')
grid off


xlim(xl);
ylim(yl);
% xlim([75.5 80]);
title('\bf Harvestable Power');xlabel('Time (s)');ylabel('Power (\muW)')

for n = 1:length(pks)
    for m = round((fs*locs(n))):-1:1    %Starting at location of peak, count backward
        if P(m,2) <= 10e-6    %was 0.01e-6
%             peak_start = P(m,1);    %Location of start of peak, in time
            peak_start = P(m,1)*fs; %Location of start of peak, in sample number
            break;
        end
    end
    for m = round((fs*locs(n))):1:length(P(:,2))    %Starting at location of peak, count forward
        if P(m,2) <= 10e-6
%             peak_end = P(m,1);  %Location of end of peak, in time
            peak_end = P(m,1)*fs;   %Location of end of peak, in sample number
            break;
        end
    end
    peak_dimensions(n,:) = [peak_start, peak_end];
end

for n = 1:length(pks)
    peak_widths(n) = (peak_dimensions(n,2) - peak_dimensions(n,1))*1/fs;
    peak_energies(n) = energy(peak_dimensions(n,2)) - energy(peak_dimensions(n,1));
    avg_peak_powers(n) = peak_energies(n)/(peak_dimensions(n,2)/fs - peak_dimensions(n,1)/fs);
end


for n = 1:length(pks)
    txt1 = num2str(round(avg_peak_powers(n)*1e6));
    txt2 = num2str(peak_widths(n));
    text3 = char(txt1, txt2);
    text(locs(n),pks(n),text3,'Clipping','on')
end

total_avg_power = nanmean(avg_peak_powers(1,length(pks)))*1e6;
total_avg_power = nanmean(avg_peak_powers)*1e6;
avg_peak_width = mean(nonzeros(peak_widths(1,length(pks))));
avg_peak_width = mean(peak_widths);

set(handles.text_avg_pk_pwr, 'String', num2str(total_avg_power));
set(handles.text_avg_peak_width, 'String', num2str(avg_peak_width));



% --- Executes during object creation, after setting all properties.
function input_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate input_plot


% --- Executes during object creation, after setting all properties.
function output_power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output_power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate output_power


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global P time
axes(handles.output_power);
cla

axes(handles.output_power);
plot(P(:,1), P(:,2).*1e6)
%plot(simout.time, simout.data.*1e6);
title('\bf Harvestable Power');xlabel('Time (s)');ylabel('Power (\muW)')
grid off

legend('off')
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exportfig.
function exportfig_Callback(hObject, eventdata, handles)
% hObject    handle to exportfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
export_fig GUI.pdf -transparent
