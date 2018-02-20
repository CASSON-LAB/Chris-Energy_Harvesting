function varargout = Transmission_Budget_GUI(varargin)
% TRANSMISSION_BUDGET_GUI MATLAB code for Transmission_Budget_GUI.fig
%      TRANSMISSION_BUDGET_GUI, by itself, creates a new TRANSMISSION_BUDGET_GUI or raises the existing
%      singleton*.
%
%      H = TRANSMISSION_BUDGET_GUI returns the handle to a new TRANSMISSION_BUDGET_GUI or the handle to
%      the existing singleton*.
%
%      TRANSMISSION_BUDGET_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSMISSION_BUDGET_GUI.M with the given input arguments.
%
%      TRANSMISSION_BUDGET_GUI('Property','Value',...) creates a new TRANSMISSION_BUDGET_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Transmission_Budget_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Transmission_Budget_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Transmission_Budget_GUI

% Last Modified by GUIDE v2.5 24-Jan-2018 16:16:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Transmission_Budget_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Transmission_Budget_GUI_OutputFcn, ...
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


% --- Executes just before Transmission_Budget_GUI is made visible.
function Transmission_Budget_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
global cap_multiplier
cap_multiplier = 1E-6;

handles.popupmenu1.Value = 2;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Transmission_Budget_GUI (see VARARGIN)

% Choose default command line output for Transmission_Budget_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Transmission_Budget_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Transmission_Budget_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in updatebutton.
function updatebutton_Callback(hObject, eventdata, handles)
global P energy time cap_multiplier fs lossy_voltage voltage_developed lossy_energy energy_input_change
clear lossy_energy
% hObject    handle to updatebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.output_power);
plot(P(:,1), P(:,2).*1e6);
title('\bf Harvestable Power');xlabel('Time (s)');ylabel('Power (\muW)');

axes(handles.cumulative_energy);
plot(time, energy)
title('\bf Harvested Energy'); xlabel('Time (s)'); ylabel('Energy (J)');

capacitance = str2double(get(handles.edit_capacitance, 'String')) * cap_multiplier;
cap_voltage = str2double(get(handles.edit_cap_voltage, 'String'));

max_energy_stored = 0.5 * capacitance * cap_voltage * cap_voltage;
set(handles.text_maxenergystore, 'String', num2str(max_energy_stored));



for i=2:length(energy)
energy_input_change(i)=energy(i)-energy(i-1);
end

loss_rate = str2double(get(handles.edit_losses, 'String')) * 1e-6;

% lossy_energy(1) = 0;
% for i=2:length(energy)
%     lossy_energy(i) = lossy_energy(i-1) + energy_input_change(i) - loss_rate;
% end
leakage_resistance = loss_rate /1e-6;
 
lossy_voltage(1) = 0;
lossy_energy(1) = 0;
voltage_developed(1) = 0;
for i=2:length(energy)
    voltage_developed(i) = sqrt((2*energy_input_change(i)/capacitance));
    lossy_voltage(i) = voltage_developed(i) * exp(-(1/fs)/(leakage_resistance*capacitance));
    lossy_energy(i) = capacitance * lossy_voltage(i) * lossy_voltage(i);
end



axes(handles.cap_energy_total); %Bring focus to plot
plot(time, lossy_energy);
title('\bf Total Energy'); xlabel('Time (s)'); ylabel('Energy (J)');







energy_limited = lossy_energy;
energy_limited(energy_limited>max_energy_stored) = max_energy_stored;

axes(handles.energy_limited); %Bring focus to plot
plot(time, energy_limited);
title('\bf Stored Energy'); xlabel('Time (s)'); ylabel('Energy (J)');

capacitor_voltage = (sqrt(2*energy_limited*capacitance))/capacitance;

axes(handles.cap_plate_voltage);
plot(time, capacitor_voltage);
title('\bf Capacitor Voltage'); xlabel('Time (s)'); ylabel('Voltage (V)');



%leakage_resistance = str2double(get(handles.edit_losses, 'String'));

% lossy_voltage(1) = 0;
% lossy_energy(1) = 0;
% voltage_developed(1) = 0;
% for i=2:length(energy)
%     voltage_developed(i) = voltage_developed(i-1) + (sqrt(2*energy_input_change(i)*capacitance))/capacitance;
%     lossy_voltage(i) = voltage_developed(i) * exp(-(1/fs)/(leakage_resistance*capacitance));
%     lossy_energy(i) = capacitance * lossy_voltage(i) * lossy_voltage(i);
% end












% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_capacitance_Callback(hObject, eventdata, handles)
% hObject    handle to edit_capacitance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_capacitance as text
%        str2double(get(hObject,'String')) returns contents of edit_capacitance as a double


% --- Executes during object creation, after setting all properties.
function edit_capacitance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_capacitance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_cap_voltage_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cap_voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cap_voltage as text
%        str2double(get(hObject,'String')) returns contents of edit_cap_voltage as a double


% --- Executes during object creation, after setting all properties.
function edit_cap_voltage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cap_voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global cap_multiplier
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str = get(hObject, 'String');
val = get(hObject, 'Value');
switch str{val};
    case 'nF'
        cap_multiplier = 1E-9;
    case 'uF'
        cap_multiplier = 1E-6;
    case 'mF'
        cap_multiplier = 1E-3';
    case 'F'
        cap_multiplier = 1;
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','black');
end



function edit_losses_Callback(hObject, eventdata, handles)
% hObject    handle to edit_losses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_losses as text
%        str2double(get(hObject,'String')) returns contents of edit_losses as a double


% --- Executes during object creation, after setting all properties.
function edit_losses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_losses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
export_fig GUI.pdf -transparent

