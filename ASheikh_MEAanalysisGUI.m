%Code written by: 
%Aminah Sheikh, PhD
%Hashimoto-Torii Lab, Children's National Health System

%Awais Mansoor, PhD
%Sheikh Zayed Institute for Pediatric Surgical Innovation, Children's
%National Health System 

%Code written for use of Multi-electrode automated analysis on 3D 60 Channel MEA
%extracellular recordings of coronal motor cortex 300 um slices
%Data acquired through Multichannel Systems, Multi Channel Experimenter, 
%Version: V 2.11.4, Release: 2019-02-21, https://www.multichannelsystems.com/software/multi-channel-experimenter

%---------------------------------------------------------------------------------------------------------------------

function varargout = ASheikh_MEAanalysisGUI(varargin)
% ASHEIKH_MEAANALYSISGUI MATLAB code for ASheikh_MEAanalysisGUI.fig
%      ASHEIKH_MEAANALYSISGUI, by itself, creates a new ASHEIKH_MEAANALYSISGUI or raises the existing
%      singleton*.
%
%      H = ASHEIKH_MEAANALYSISGUI returns the handle to a new ASHEIKH_MEAANALYSISGUI or the handle to
%      the existing singleton*.
%
%      ASHEIKH_MEAANALYSISGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASHEIKH_MEAANALYSISGUI.M with the given input arguments.
%
%      ASHEIKH_MEAANALYSISGUI('Property','Value',...) creates a new ASHEIKH_MEAANALYSISGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ASheikh_MEAanalysisGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ASheikh_MEAanalysisGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ASheikh_MEAanalysisGUI

% Last Modified by GUIDE v2.5 14-Jun-2018 11:59:45

% Begin initialization code - DO NOT EDIT
 
warning off 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ASheikh_MEAanalysisGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ASheikh_MEAanalysisGUI_OutputFcn, ...
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




% --- Executes just before ASheikh_MEAanalysisGUI is made visible.
function ASheikh_MEAanalysisGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ASheikh_MEAanalysisGUI (see VARARGIN)

% Choose default command line output for ASheikh_MEAanalysisGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ASheikh_MEAanalysisGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ASheikh_MEAanalysisGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in path_browse.
function path_browse_Callback(hObject, eventdata, handles)
% hObject    handle to path_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tmp = uigetdir('Choose data directory');
handles.defaults.path_2data='';
handles.defaults.path_data='';
if ~isempty(tmp) && (tmp(1)~=0)
    [handles.defaults.path_2data,handles.defaults.path_data] = fileparts(tmp);
end

fn = fullfile(handles.defaults.path_2data,handles.defaults.path_data);
set(handles.data_path,'string',fn);
handles.defaults.fullpath=fn;
drawnow;
guidata(hObject, handles);
return



function data_file_Callback(hObject, eventdata, handles)
% hObject    handle to data_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_file as text
%        str2double(get(hObject,'String')) returns contents of data_file as a double
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in data_load.
function data_load_Callback(hObject, eventdata, handles)
% hObject    handle to data_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[tmp1 tmp2] = uigetfile('*.mat','Choose a MEA txt data file',handles.defaults.fullpath);
if ~isempty(tmp1) && (tmp1(1)~=0) && ~isempty(tmp2) && (tmp2(1)~=0)
    handles.defaults.path_file = tmp2;
    handles.defaults.file = tmp1;
else
    return
end
fn = fullfile(handles.defaults.path_file,handles.defaults.file);
handles.data.file=fn;
set(handles.data_file,'string',fn);
drawnow;

%[data,si] = abfload2( fn ); %Sample intreval is in us

% handles.data.data=data;
% handles.data.sample_interval=si;
guidata(hObject, handles);
%datchan=str2double(get(handles.channel_data,'String'));
%voltage=squeeze(handles.data.data(:,datchan,:));
%[pts,recs]=size(voltage);

%fprintf('%i channels %i pts %i traces\n',size(data,2),size(data,1),recs);

%set(handles.traces_selected,'String',sprintf('1:%i',recs));

return


% --- Executes on button press in save_results.
function save_results_Callback(hObject, eventdata, handles)
% hObject    handle to save_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
settings=handles.settings;
results=handles.results;
save (sprintf('%s_analysis.mat',handles.data.file),'-mat','settings','results');

% --- Executes on button press in load_results.
function load_results_Callback(hObject, eventdata, handles)
% hObject    handle to load_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('loading not implemented yet');


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in plot_file_type.
function plot_file_type_Callback(hObject, eventdata, handles)
% hObject    handle to plot_file_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plot_file_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plot_file_type


% --- Executes during object creation, after setting all properties.
function plot_file_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot_file_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in auto_analysis.
function auto_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to auto_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function for batch-processing.
hhh = findall(0,'type','figure','tag','TMWWaitbar'); 
delete(hhh);


tmp = uigetdir('Choose root directory for batch processing');
handles.defaults.path_2grp1='';
handles.defaults.path_grp1='';
if ~isempty(tmp) && (tmp(1)~=0)
    [handles.defaults.path_2grp1,handles.defaults.path_grp1] = fileparts(tmp);
end

fn = fullfile(handles.defaults.path_2grp1,handles.defaults.path_grp1);
set(handles.grp1path,'string',fn);
% handles.defaults.fullpath=fn;
% drawnow;
% guidata(hObject, handles);
recordings={'rec2', 'rec3', 'rec4'};
count=0;
hhh=waitbar(0,'Now processing...','Name','ASheikh_MEAanalysis...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
movegui(hhh,'north')
WinOnTop(hhh)
setappdata(hhh,'canceling',0);

for ttt=1:numel(recordings)
if ispc %If PC
   handles.fileslist_batch = dir(strcat(tmp,strcat('\**\',recordings{ttt},'\*_sweep.mat'))); 
elseif ismac %If Mac
    handles.fileslist_batch = dir(strcat(tmp,strcat('/**/',recordings{ttt},'/*_sweep.mat')));
end

handles.flag=0;
% progressbar(0)
for ii=1:numel(handles.fileslist_batch)   
    
    if ispc %If PC
        fn=strcat(handles.fileslist_batch(ii).folder,'\',handles.fileslist_batch(ii).name);
        NEWSTR = split(handles.fileslist_batch(ii).folder,'\');
    elseif ismac %If Mac
       fn=strcat(handles.fileslist_batch(ii).folder,'/',handles.fileslist_batch(ii).name);
       NEWSTR = split(handles.fileslist_batch(ii).folder,'/');
    end
    
    ii
    %Everything that is performed for the single recording using "MEA
    %Analysis" button will be executed.
    

    waitbar(count/(numel(recordings)*numel(handles.fileslist_batch)),hhh,strcat('Now processing...', NEWSTR{length(NEWSTR)-2},'...', NEWSTR{length(NEWSTR)-1},'...', NEWSTR{length(NEWSTR)-0}));
    
%     set(hhh,'WindowStyle', 'Modal')
    
    

    perform_MEA_Analysis(handles, fn);   
    count=count+1;
    
    if getappdata(hhh,'canceling')
        break
    end
    
    close(1)
    close(9)
    close(10)
    close(11)
    

    
%     progressbar(ii/numel(handles.fileslist_batch)) 
    
end
end
delete(hhh)
% Mesaage box to announce the completion of Bacth-Processing.
msgbox('Batch Processing Completed!!');



return


% --- Executes on button press in do_mea.
function do_mea_Callback(hObject, eventdata, handles)
% hObject    handle to do_mea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%uses exported txt files from MCS analysis software

%For calculating & plotting the change in the amplitude (peak-to-peak) over
%the recording for selected electrodes 
%Aminah Sheikh, PhD
%Feb 13 2018-CNMC-HashimotoToriiLab
%----------------------------------------

%command: delta_ampl_sweep(masterpaechr2meadata.notHSE.l23.peak2peak.group2prelim.mouse004.slice4.rec3,'DeltaAmpl_McsRecording_ASheikh_2017-11-10T16-23-02_e26to86_subplots')

%1) create matrix for input of the delta amplitude calculation 
%but in the specified location particular to the recording 

%2) need the t120 (response 1) and t150 (last response from ChR2 stim) in
%matrix

%3) take difference and create the matrix for the delta amplitude. Input
%calculation in the specified matrix in (1)

[tmp1 tmp2] = uigetfile('*.mat','Choose a MEA mat data file',handles.defaults.fullpath);
if ~isempty(tmp1) && (tmp1(1)~=0) && ~isempty(tmp2) && (tmp2(1)~=0)
    handles.defaults.path_file = tmp2;
    handles.defaults.file = tmp1;
else
    return
end
fn = fullfile(handles.defaults.path_file,handles.defaults.file);
handles.flag=1;
set(handles.data_file,'string',fn);
perform_MEA_Analysis(handles, fn)

function delta_ampl_sweep(structname,titlestr)
%close all

structname.delta_elec_p2p_t1_t2 = structname.electrodes_p2p_t1_t2(:,2)-structname.electrodes_p2p_t1_t2(:,3);
aa = structname.delta_elec_p2p_t1_t2;

figure('Name',titlestr)
bar(aa*-1)
xticklabels({'e27','e37','e47','e57','e67','e77','e87'})
xlabel('Electrode Number')
ylabel('Change in fEPSP Amplitude (uV)')
title('Change in fEPSP Amplitude (uV) of ChR2 Response - 30 sec')
set(gca,'ylim',[-60 10])
structname.delta_elec_p2p_t1_t12 = aa;

saveas(gcf,titlestr,'epsc')
saveas(gcf,titlestr,'fig')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in load_structname.
function load_structname_Callback(hObject, eventdata, handles)
% hObject    handle to load_structname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in peak_ampl.
function peak_ampl_Callback(hObject, eventdata, handles)
% hObject    handle to peak_ampl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in perc_chg_peakampl.
function perc_chg_peakampl_Callback(hObject, eventdata, handles)
% hObject    handle to perc_chg_peakampl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mea_layout.
function mea_layout_Callback(hObject, eventdata, handles)
% hObject    handle to mea_layout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure
filename='MEAlayout.png';
h=imshow(filename);
% image(h);



function edit_baseline_Callback(hObject, eventdata, handles)
% hObject    handle to edit_baseline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_baseline as text
%        str2double(get(hObject,'String')) returns contents of edit_baseline as a double


% --- Executes during object creation, after setting all properties.
function edit_baseline_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_baseline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stim_time_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stim_time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stim_time_edit as text
%        str2double(get(hObject,'String')) returns contents of stim_time_edit as a double


% --- Executes during object creation, after setting all properties.
function stim_time_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stim_time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over plot_file_type.
function plot_file_type_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to plot_file_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function data_file_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function data_path_Callback(hObject, eventdata, handles)
% hObject    handle to data_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_path as text
%        str2double(get(hObject,'String')) returns contents of data_path as a double

% --- Executes during object creation, after setting all properties.
function data_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setgrp1.
function setgrp1_Callback(hObject, eventdata, handles)
% hObject    handle to setgrp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tmp = uigetdir('Choose root directory for group 1');
handles.defaults.path_2grp1='';
handles.defaults.path_grp1='';
if ~isempty(tmp) && (tmp(1)~=0)
    [handles.defaults.path_2grp1,handles.defaults.grp1] = fileparts(tmp);
end

fn = fullfile(tmp);
set(handles.grp1path,'string',fn);
handles.defaults.fullpath=fn;
drawnow;
guidata(hObject, handles);

if ispc
    handles.fileslist_grp1 = dir(strcat(fn,'\**\rec2\*.mat')); %TODO: change from rec 2 to a more generic option.
elseif ismac
    handles.fileslist_grp1 = dir(strcat(fn,'/**/rec2/*.mat')); %TODO: change from rec 2 to a more generic option.
end
    

guidata(hObject, handles);
return

% --- Executes on button press in setgrp2.
function setgrp2_Callback(hObject, eventdata, handles)
% hObject    handle to setgrp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tmp = uigetdir('Choose root directory for group 2');
handles.defaults.path_2grp2='';
handles.defaults.path_grp2='';
if ~isempty(tmp) && (tmp(1)~=0)
    [handles.defaults.path_2grp2,handles.defaults.grp2] = fileparts(tmp);
end

fn = fullfile(tmp);
set(handles.grp2path,'string',fn);
handles.defaults.fullpath=fn;
drawnow;
guidata(hObject, handles);

if ispc
    handles.fileslist_grp2 = dir(strcat(fn,'\**\rec4\*.mat')); %TODO: change from rec 2 to a more generic option.
elseif ismac
    handles.fileslist_grp2 = dir(strcat(fn,'/**/rec4/*.mat')); %TODO: change from rec 2 to a more generic option.
end

guidata(hObject, handles);
return


function grp1path_Callback(hObject, eventdata, handles)
% hObject    handle to grp1path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of grp1path as text
%        str2double(get(hObject,'String')) returns contents of grp1path as a double


% --- Executes during object creation, after setting all properties.
function grp1path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grp1path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function grp2path_Callback(hObject, eventdata, handles)
% hObject    handle to grp2path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of grp2path as text
%        str2double(get(hObject,'String')) returns contents of grp2path as a double


% --- Executes during object creation, after setting all properties.
function grp2path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grp2path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in do_stats.
function do_stats_Callback(hObject, eventdata, handles)
% hObject    handle to do_stats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
content_grp1=handles.fileslist_grp1;
content_grp2=handles.fileslist_grp2;


stim=16;
effective_row=zeros(1,stim);

for ii=1:numel(content_grp2)
    
   load(fullfile(content_grp2(ii).folder,content_grp2(ii).name));
   summary_peaks=zeros(8,stim+1);
   count=0;
   
   size(mydictlist,2);
   
    for iii=12:87
        if rem(iii,10)~=0 && rem(iii,10)~=9
            count=count+1;
            tt=mydictlist(iii,:);
            electrode_list(count)=mydictlist(iii).electrode;
            for i=1:numel(tt)
                xx(i) =tt(i).time;  
                yy(i,count)=tt(i).peak2peak;
            end
            
            if max(xx)<300
               break; 
            end
            
            
            
            [c, basline_time_idx] = min(abs(sqrt((xx-120).^2)));           %REDO
            [c, stim_time_closest_idx] = min(abs(sqrt((xx-150).^2)));      %REDO
            
            if ~isnan(sum(yy(:,count)))
                summary_peaks(rem(electrode_list(count),10),1:stim)=summary_peaks(rem(electrode_list(count),10),1:stim)+(yy(basline_time_idx:stim_time_closest_idx,count))';                                
                summary_peaks(rem(electrode_list(count),10),stim+1)=summary_peaks(rem(electrode_list(count),10),stim+1)+1;
            end
            

        end

    end
    
    if max(xx)>300
       continue; 
    end
        avg=summary_peaks(:,1:16)./summary_peaks(:,17);
        %stdev_gp2=std(summary_peaks(:,1:16));
        norm=sum(avg,2)/max(sum(avg,2));
        [~,idx]=max(norm);

        effective_row(ii,:)=avg(idx,:);

        if ismac
            C = strsplit(content_grp2(ii).folder,'/');    
        elseif ispc
            C = strsplit(content_grp2(ii).folder,'\');
        end
        animalID{ii}=C{numel(C)-2};
    
    
    
    
end
effective_row_gp2=mean(effective_row);
stdev_gp2=std(effective_row);
H=figure(1);
%scatter(1:10:160,effective_row_gp2,'r')
errorbar(1:10:160,effective_row_gp2,stdev_gp2,'ro');


effective_row_gp2=mean(effective_row);
animalUnique=unique(animalID);
effective_row_animal=zeros(numel(animalUnique),stim);

for ii=1:numel(animalID)
    for jj=1:numel(animalUnique)        
        if strcmp(animalID{ii},animalUnique{jj})
            effective_row_animal(jj,:)=effective_row_animal(jj,:)+effective_row(ii,:);          
            
        end       
        
    end    
end


mean_animal=mean(effective_row_animal);
std_animal=std(effective_row_animal);

fid = fopen(fullfile(handles.defaults.path_2grp1,'group2.csv'),'w');
str='stim';
for jj=1:stim
    str=strcat(str,',',num2str(jj));
    
end
fprintf(fid,'%s\n',str);

for ii=1:numel(animalUnique)
    str=animalUnique{ii};
    str02='';
    for jj=1:stim
        str02=strcat(str02,',',num2str(effective_row_animal(ii,jj)));
    end
    str=strcat(str,str02);
    
    fprintf(fid,'%s\n',str);

    
    
end

str='mean';
str02='';
for jj=1:stim
   str02=strcat(str02,',',num2str(mean_animal(jj)));   
end
str=strcat(str,str02);
fprintf(fid,'%s\n',str);

str='stdev';
str02='';
for jj=1:stim
   str02=strcat(str02,',',num2str(std_animal(jj)));   
end
str=strcat(str,str02);
fprintf(fid,'%s\n',str);

fclose(fid);



effective_row=zeros(1,stim);

for ii=1:numel(content_grp1)
    
   load(fullfile(content_grp1(ii).folder,content_grp1(ii).name));
   summary_peaks=zeros(8,stim+1);
   count=0;
   
   size(mydictlist,2);
   
    for iii=12:87
        if rem(iii,10)~=0 && rem(iii,10)~=9
            count=count+1;
            tt=mydictlist(iii,:);
            electrode_list(count)=mydictlist(iii).electrode;
            for i=1:numel(tt)
                xx(i) =tt(i).time;  
                yy(i,count)=tt(i).peak2peak;
            end
            
            [c, basline_time_idx] = min(abs(sqrt((xx-120).^2)));           %REDO
            [c, stim_time_closest_idx] = min(abs(sqrt((xx-150).^2)));      %REDO
            
            if ~isnan(sum(yy(:,count)))
                summary_peaks(rem(electrode_list(count),10),1:stim)=summary_peaks(rem(electrode_list(count),10),1:stim)+(yy(basline_time_idx:stim_time_closest_idx,count))';
                summary_peaks(rem(electrode_list(count),10),stim+1)=summary_peaks(rem(electrode_list(count),10),stim+1)+1;
            end
            

        end

    end
    
    avg=summary_peaks(:,1:16)./summary_peaks(:,17);
    stdev_gp1=std(summary_peaks(:,1:16));
    norm=sum(avg,2)/max(sum(avg,2));
    [~,idx]=max(norm);
    
    effective_row(ii,:)=avg(idx,:);
    
    if ismac
        C = strsplit(content_grp2(ii).folder,'/');    
    elseif ispc
        C = strsplit(content_grp2(ii).folder,'\');
    end
    
    animalID_gp1{ii}=C{numel(C)-2};
    
end
effective_row_gp1=mean(effective_row);
stdev_gp1=std(effective_row);

effective_row_gp1=mean(effective_row);
animalUnique_gp1=unique(animalID_gp1);
effective_row_animal=zeros(numel(animalUnique_gp1),stim);

for ii=1:numel(animalID_gp1)
    for jj=1:numel(animalUnique_gp1)        
        if strcmp(animalID_gp1{ii},animalUnique_gp1{jj})
            effective_row_animal(jj,:)=effective_row_animal(jj,:)+effective_row(ii,:);          
            
        end       
        
    end    
end


mean_animal=mean(effective_row_animal,1);
if size(effective_row_animal,1)==1
    std_animal=zeros(1,stim);
else
    std_animal=std(effective_row_animal,1);
end

fid = fopen(fullfile(handles.defaults.path_2grp1,'group1.csv'),'w');
str='stim';
for jj=1:stim
    str=strcat(str,',',num2str(jj));
    
end
fprintf(fid,'%s\n',str);

for ii=1:numel(animalUnique_gp1)
    str=animalUnique_gp1{ii};
    str02='';
    for jj=1:stim
        str02=strcat(str02,',',num2str(effective_row_animal(ii,jj)));
    end
    str=strcat(str,str02);
    
    fprintf(fid,'%s\n',str);

    
    
end

str='mean';
str02='';
for jj=1:stim
   str02=strcat(str02,',',num2str(mean_animal(jj)));   
end
str=strcat(str,str02);
fprintf(fid,'%s\n',str);

str='stdev';
str02='';
for jj=1:stim
   str02=strcat(str02,',',num2str(std_animal(jj)));   
end
str=strcat(str,str02);
fprintf(fid,'%s\n',str);

fclose(fid);




hold on
errorbar(1:10:160,effective_row_gp1,stdev_gp1,'ok')
xlabel('Number of Stimuli')
ylabel('Peak Amplitude (uV)')
saveas(H,fullfile(handles.defaults.path_2grp1,'summaryPlot_errorbars.eps'),'epsc');
savefig(fullfile(handles.defaults.path_2grp1,'summaryPlot_errorbars.fig'));

H=figure(2);
scatter(1:10:160,effective_row_gp2,'or')
hold on
scatter(1:10:160,effective_row_gp1,'ok')
xlabel('Number of Stimuli')
ylabel('Peak Amplitude (uV)')
saveas(H,fullfile(handles.defaults.path_2grp1,'summaryPlot_scatter.eps'),'epsc');
savefig(fullfile(handles.defaults.path_2grp1,'summaryPlot_scatter.fig'));




function perform_MEA_Analysis(handles, fn)

load(fn)
[pathstr,name,ext] = fileparts(fn);
aa=dir(fullfile(pathstr,'spike data','analysis*'))

if exist(fullfile(pathstr,'spike data',aa.name))==7
    spike_analysis_file=dir(fullfile(pathstr,'spike data',aa.name,'*.mat'))
    load(fullfile(spike_analysis_file.folder,spike_analysis_file.name))
end

% COUNT=1;
% 
% 
% for ii=1:size(mydictlist,1)
%      if ~isnan(mydictlist(ii).time)
%          COUNT=COUNT+1;
% 
%      end
% end

count=1;
for num=1:8
    figure('units','normalized','outerposition',[0 0 1 1])
    
end

for ii=1:size(mydictlist,1)
    
    quotient=floor(ii/10);
    my_rem=rem(ii,10);
   
    if ~isnan(mydictlist(ii).time)
        tt=mydictlist(ii,:); 
        for i=1:numel(tt)
            x(i,1) =tt(i).time;
            y(i,ii)=tt(i).peak2peak;
        end  
        
        if max(x)<240
            close all
            msgbox('Recording less than 240 sec!!');
            return
        end
        
        
        figure(my_rem);
        hold on
        scatter(x,y(:,ii),'o');
        set(gca,'ylim',[0 200])
        xlabel('Time (sec)')
        ylabel('Peak Amplitude (uV)')
        title(strcat('Electrode Row of ',num2str(my_rem),'s'))
%         scatter(x,y(:,ii),'.');
        my_legends{quotient, my_rem}=strcat('Electrode #',num2str(mydictlist(ii).electrode));
%         legend(my_legends)
%         count=count+1;
        
    end    
end

idx={'Peakampl_elec21_71', 'Peakampl_elec12_82', 'Peakampl_elec13_83', 'Peakampl_elec14_84', 'Peakampl_elec15_85', 'Peakampl_elec16_86', 'Peakampl_elec17_87', 'Peakampl_elec28_78'};
[pathstr,name,ext] = fileparts(fn);

for num=1:8
    H=figure(num)
    hold off
    
    R=my_legends(:,num);
    R = R(~cellfun('isempty',R)) ;
    legend(R)
    savefig(fullfile(pathstr,strcat(idx{num},'.fig')));
    
    if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat(idx{num},'.png')),'-dpng');
% saveas(gcf,titlestr,'epsc')
% saveas(gcf,titlestr,'fig')
    else
%         print(strcat('-f',num2str(num)), strcat(pathstr,'\',idx{num},'.eps'),'-dwin');
        saveas(H,fullfile(pathstr,strcat(idx{num},'.eps')),'epsc')
    end
    
    close(H)
    
    
%     xlabel('Time (sec)')
%     ylabel('Peak Amplitude (units?)')

end



%     title(tmp1)
    
my_legends02=my_legends;
% close all
count=0;
for ii=12:87
    if rem(ii,10)~=0 && rem(ii,10)~=9
        count=count+1;
        tt=mydictlist(ii,:);
        electrode_list(count)=mydictlist(ii).electrode;
        for i=1:numel(tt)
            xx(i) =tt(i).time;  
            yy(i,count)=tt(i).peak2peak;
            yy_min(i,count)=tt(i).minimum;
            yy_max(i,count)=tt(i).maximum;
            yy_slope(i,count)=tt(i).slope;
        end
        
    end
    
end

% fid = fopen(strcat(pathstr,'\','PeakAmplitude02','.csv'),'w');
% fid_min = fopen(strcat(pathstr,'\','Minimum','.csv'),'w');
% fid_max = fopen(strcat(pathstr,'\','Maximum','.csv'),'w');
% fid_slope = fopen(strcat(pathstr,'\','Slope','.csv'),'w');


fid = fopen(fullfile(pathstr,strcat('PeakAmplitude','.csv')),'w');
fid_min = fopen(fullfile(pathstr,strcat('Minimum','.csv')),'w');
fid_max = fopen(fullfile(pathstr,strcat('Maximum','.csv')),'w');
fid_slope = fopen(fullfile(pathstr,strcat('Slope','.csv')),'w');


for ii=1:numel(electrode_list)
str=strcat(',',num2str(electrode_list(ii)));
fprintf(fid,'%s',str);
fprintf(fid_min,'%s',str);
fprintf(fid_max,'%s',str);
fprintf(fid_slope,'%s',str);
end
fprintf(fid,'%s\n',str);
fprintf(fid_min,'%s\n',str);
fprintf(fid_max,'%s\n',str);
fprintf(fid_slope,'%s\n',str);

for iii=1:numel(xx)
    for ii=1:numel(electrode_list)
        str=strcat(num2str(xx(iii)),',',num2str(yy(iii,ii)));
        fprintf(fid,'%s',str);
        
        str_min=strcat(num2str(xx(iii)),',',num2str(yy_min(iii,ii)));
        fprintf(fid_min,'%s',str);
        
        str_max=strcat(num2str(xx(iii)),',',num2str(yy_max(iii,ii)));
        fprintf(fid_max,'%s',str);
        
        str_slope=strcat(num2str(xx(iii)),',',num2str(yy_slope(iii,ii)));
        fprintf(fid_slope,'%s',str);

    end
    fprintf(fid,'%s\n',str);
    fprintf(fid_min,'%s\n',str_min);
    fprintf(fid_max,'%s\n',str_max);
    fprintf(fid_slope,'%s\n',str_slope);
end

fclose(fid);
fclose(fid_min);
fclose(fid_max);
fclose(fid_slope);

[pathstr,name,ext] = fileparts(fn);
msrd_file=dir(strcat(pathstr,'/raw data/','*.msrd'));

if exist(fullfile(pathstr,strcat('raw data/',msrd_file.name)))
    
    fileID = fopen(fullfile(pathstr,strcat('raw data/',msrd_file.name)));
    N=7;
    formatSpec = '%s %s';
    C = textscan(fileID,formatSpec,N,'CommentStyle','##','Delimiter','=');
    sTime=C{2}{7};
    datetime_msrd = datetime(sTime);
    abf_file=dir(strcat(pathstr,'/*.abf'));
    [d,si,h]=abfload2(fullfile(pathstr,abf_file.name));
    aTime=h.uFileStartTimeMS;
    temp=datetime(h.uFileStartDate,'ConvertFrom', 'yyyymmdd')
    hrs=aTime/1000/60/60;
    mins=rem(hrs, floor(hrs))*60;
    secs=rem(mins,floor(mins))*60;
    datetime_abf = datetime(year(temp), month(temp), day(temp), floor(hrs), floor(mins), floor(secs));

    ts=seconds(datetime_abf-datetime_msrd);

    basline_time= str2num(handles.edit_baseline.String);
    stim_time= str2num(handles.stim_time_edit.String);
    % 
    [c, basline_time_pre_idx] = min(abs(xx-basline_time));
    [c, stim_time_pre_idx] = min(abs(xx-(basline_time+stim_time)));
    % 
    % 
    % basline_time_distance=sqrt((xx-basline_time).^2);
    % basline_time_window=find(basline_time_distance<4);
    % 
    % [val,idx]=max(yy(basline_time_window,:));
    % idx02=[];
    % for ii=1:numel(idx)   
    %     if ~isnan(val(ii))
    %        idx02=[idx02;idx(ii)];         
    %     end    
    % end

    % baseline_most_frequent_idx=mode(idx02);
    % basline_time_idx=basline_time_window(baseline_most_frequent_idx);
    E_distance = sqrt(sum((xx-ts*ones(length(xx),1)).^2));
    [c, basline_time_idx] = min(abs(sqrt(sum((xx-ts*ones(length(xx),1)).^2))));
    t2=xx(basline_time_idx)+8;
    stim_time_closest_idx=find(xx==t2);



    fid = fopen(fullfile(pathstr,strcat('percent_change','.csv')),'w');
    electrode_list_reshape=reshape([11 electrode_list 88],8,8)
    electrode_list_transpose=electrode_list_reshape';
    electrode_list_transpose=electrode_list_transpose(:);
    electrode_list_transpose(1)=[];
    electrode_list_transpose(end)=[];
end
psr_matrix=zeros(8);
delta_matrix=zeros(8);
theta_matrix=zeros(8);
alpha_matrix=zeros(8);
beta_matrix=zeros(8);
gamma_matrix=zeros(8);

for ii=1:numel(electrode_list)
    if exist(fullfile(pathstr,strcat('raw data/',msrd_file.name)))
    
        idxs=find(electrode_list==electrode_list_transpose(ii));
        yyy=yy(:,ii);
        for iii=1:2
           ids_grubbs=isoutlier(yyy,'mean');
           yyy(find(ids_grubbs))=mean(yyy);
    %        xx(find(ids_grubbs))=[];
        end 
        my_rem=rem(electrode_list(ii),10);
        figure(my_rem);
        hold on
        scatter(x,y(:,ii),'o');
        set(gca,'ylim',[0 200])
        xlabel('Time (sec)')
        ylabel('Outlier Removed Peak Amplitude (uV)')
        title(strcat('Electrode Row of ',num2str(my_rem),'s'))
    %         scatter(x,y(:,ii),'.');
        my_legends{quotient, my_rem}=strcat('Electrode #',num2str(mydictlist(ii).electrode));

    %     yyy_mean(idx)=mean(yyy);
    %     yy_mean(ii)=mean(yy(:,ii));
        effective_response_electrode(ii)=mean(yyy(basline_time_pre_idx:stim_time_pre_idx))-mean(yyy);

        if abs(effective_response_electrode(ii))>0.9999
            [val idx]=max(yyy(basline_time_idx:stim_time_closest_idx));
            t2=basline_time_idx+idx+15;

            H=figure(9)
            set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    %         title('Peak Amplitude')

            subplot(8,8,idxs+1)        
    %         scatter(1:150,yyy(basline_time_idx+idx:basline_time_idx+idx+15))        
            scatter(1:2:2*length(yyy),yyy,'.')
            xlabel('Time (sec)')
            ylabel('Voltage (uV)')
            title(num2str(electrode_list(ii)))
            set(gca,'ylim',[0 150])

            percent_change(ii)=(yyy(t2)-val)*100/val;
            latency(ii)=xx(basline_time_idx+idx-1)-xx(basline_time_idx);
            percent_change;
            str=strcat(num2str(electrode_list(ii)),',',num2str(percent_change(ii)),',',num2str(latency(ii)));
            fprintf(fid,'%s\n',str);
        elseif electrode_list(ii)==18 || electrode_list(ii)==81
            continue;
        else
            figure(9)
            subplot(8,8,idxs+1)
            title(num2str(electrode_list(ii)))
            text(0.5, 0.5, 'No Response','HorizontalAlignment','center', 'VerticalAlignment', 'middle', 'Color','red');
            set(gca, 'XTicklabel', 0:50:300);
            percent_change(ii)=0;
            str=strcat(num2str(electrode_list(ii)),',NoResponse');
            fprintf(fid,'%s\n',str);
        end
    
    
        if abs(effective_response_electrode(ii))>0.9999
            [val idx]=max(yyy(basline_time_idx:stim_time_closest_idx));
            t2=basline_time_idx+idx+15;

            H1=figure(10)
            set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    %         title('Peak Amplitude')

            ax1=subplot(8,8,idxs+1)
            spectrogram(yyy,6,2,16,0.37,'yaxis') %CHECK WITH AMINAH FOR SAMPLING FREQUENCY (Fs)
            psr_matrix(idxs+1) = bandpower(yyy,160,[20 40]);
            delta_matrix(idxs+1) = bandpower(yyy,160,[0 4]);
            theta_matrix(idxs+1) = bandpower(yyy,160,[4 8]);
            alpha_matrix(idxs+1) = bandpower(yyy,160,[8 16]);
            beta_matrix(idxs+1) = bandpower(yyy,160,[16 32]);
            gamma_matrix(idxs+1) = bandpower(yyy,160,[32 64]);
            ylabel('Frequency (Hz)')
%             xticks(0:50:300);
            set(gca, 'XTicklabel', 50:50:300);
            xlabel('Time (sec)')
            caxis(ax1, [0 50])
%             colormap(jet)
            colorbar('off')

    %         scatter(1:150,yyy(basline_time_idx+idx:basline_time_idx+idx+15))        

    %         periodogram(yyy,'twosided',512,0.5)
    %         ylabel('Power (dB)')
    %         xlabel('Frequency (Hz)')
    %         xlabel('Time (sec)')
    %         ylabel('Voltage (uV)')
            title(num2str(electrode_list(ii)))
    %         set(gca,'ylim',[0 150])

        elseif electrode_list(ii)==18 || electrode_list(ii)==81
            continue;
        else
            figure(10)
            subplot(8,8,idxs+1)
            title(num2str(electrode_list(ii)))
            text(0.5, 0.5, 'No Response','HorizontalAlignment','center', 'VerticalAlignment', 'middle', 'Color','red');        


        end
    end
    
    if exist(fullfile(spike_analysis_file.folder,spike_analysis_file.name))
        
        if  ~isempty(spikanalysislist{electrode_list(ii)})

            H2=figure(11)
            set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    %         title('Peak Amplitude')

            subplot(8,8,idxs+1)        
    %         scatter(1:150,yyy(basline_time_idx+idx:basline_time_idx+idx+15))        
            plot(spikanalysislist{electrode_list(ii)}.time, spikanalysislist{electrode_list(ii)}.frequency,'.r')
            xlabel('Time (sec)')
            ylabel('Frequency (Hz)')
    %         xlabel('Time (sec)')
    %         ylabel('Voltage (uV)')
            title(num2str(electrode_list(ii)))
            set(gca,'ylim',[0 500])

        elseif electrode_list(ii)==18 || electrode_list(ii)==81
            continue;
        else
            figure(11)
            subplot(8,8,idxs+1)
            title(num2str(electrode_list(ii)))
            text(0.5, 0.5, 'No Response','HorizontalAlignment','center', 'VerticalAlignment', 'middle', 'Color','red');        


        end
    end
    
end

figure(10)
h=colorbar;
colormap(jet)
h.Label.String='dB/Hz';
set(h, 'Position', [.9114 .11 .0181 .8150])

saveas(H1,fullfile(pathstr,'summaryPSD.eps'),'epsc');
savefig(H1, fullfile(pathstr,'summaryPSD.fig'));

saveas(H2,fullfile(pathstr,'summaryTimeFrequency.eps'),'epsc');
savefig(H2, fullfile(pathstr,'summaryTimeFrequency.fig'));

fclose(fid);

%-----gammma
gamma02=gamma_matrix';
gamma02=gamma02/max(gamma02(:));
H12=figure(12)
imagesc(gamma02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('32-64 Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H12,fullfile(pathstr,strcat('gamma.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('gamma.png')),'-dpng');
else
        saveas(H12,fullfile(pathstr,'gamma.eps'),'epsc')
end


%-------Delta
delta02=delta_matrix';
delta02=delta02/max(delta02(:));
H13=figure(13)
imagesc(delta02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('0-4 Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H13,fullfile(pathstr,strcat('gamma.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('delta.png')),'-dpng');
else
        saveas(H13,fullfile(pathstr,'delta.eps'),'epsc')
end


%-------Theta
delta02=delta_matrix';
delta02=delta02/max(delta02(:));
H14=figure(14)
imagesc(delta02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('4-8 Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H14,fullfile(pathstr,strcat('gamma.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('theta.png')),'-dpng');
else
        saveas(H14,fullfile(pathstr,'theta.eps'),'epsc')
end

%-----Alpha
alpha02=alpha_matrix';
alpha02=alpha02/max(alpha02(:));
H15=figure(15)
imagesc(alpha02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('8-16 Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H15,fullfile(pathstr,strcat('alpha.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('alpha.png')),'-dpng');
else
        saveas(H15,fullfile(pathstr,'alpha.eps'),'epsc')
end


%------Beta
beta02=beta_matrix';
beta02=beta02/max(beta02(:));
H16=figure(16)
imagesc(beta02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('16-32 Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H16,fullfile(pathstr,strcat('beta.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('beta.png')),'-dpng');
else
        saveas(H16,fullfile(pathstr,'beta.eps'),'epsc')
end


%------psr
psr02=psr_matrix';
psr02=psr02/max(psr02(:));
H17=figure(17)
imagesc(psr02)



for ii=1:8
    for jj=1:8
        str=strcat(num2str(ii),num2str(jj));
        if ~strcmp(str,{'11','18','81','88'})
            text(ii,jj,strcat(num2str(ii),num2str(jj)),'Color',[0,0,1]);
        end
    end
end
colorbar;
ylabel('20-40Hz power (normalized units)')
set(gca,'xtick',[])
set(gca,'ytick',[])
colormap(hot)
savefig(H17,fullfile(pathstr,strcat('psr_20-40.fig')));

if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat('psr_20-40.png')),'-dpng');
else
        saveas(H17,fullfile(pathstr,'psr_20-40.eps'),'epsc')
end


idx={'OutlierRmvd_Peakampl_elec21_71', 'OutlierRmvd_Peakampl_elec12_82', 'OutlierRmvd_Peakampl_elec13_83', 'OutlierRmvd_Peakampl_elec14_84', 'OutlierRmvd_Peakampl_elec15_85', 'OutlierRmvd_Peakampl_elec16_86', 'OutlierRmvd_Peakampl_elec17_87', 'OutlierRmvd_Peakampl_elec28_78'};
[pathstr,name,ext] = fileparts(fn);
for num=1:8
    H=figure(num)
    hold off
    
    R=my_legends02(:,num);
    R = R(~cellfun('isempty',R)) ;
    legend(R)
    savefig(fullfile(pathstr,strcat(idx{num},'.fig')));
    
    if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat(idx{num},'.png')),'-dpng');
% saveas(gcf,titlestr,'epsc')
% saveas(gcf,titlestr,'fig')
    else
%         print(strcat('-f',num2str(num)), strcat(pathstr,'\',idx{num},'.eps'),'-dwin');
        saveas(H,fullfile(pathstr,strcat(idx{num},'.eps')),'epsc')
    end
    
    close(H)
    
    
%     xlabel('Time (sec)')
%     ylabel('Peak Amplitude (units?)')

end

handles.percent_change=percent_change;

for ii=1:length(electrode_list)
    
    quotient=floor(electrode_list(ii)/10);
    my_rem=rem(electrode_list(ii),10);
   
   
        
        figure(my_rem);
        hold on
        bar(electrode_list(ii), percent_change(ii))
        set(gca,'ylim',[-100 100])
        xlabel('Electrode #')
        ylabel('Percent Change in Amplitude (%)')
        title(strcat('Electrode Row of ',num2str(my_rem),'s'))
%         scatter(x,y(:,ii),'.');
%         my_legends{quotient, my_rem}=strcat('Electrode #',num2str(mydictlist(ii).electrode));
%         legend(my_legends)
%         count=count+1;
        
      
end


idx={'Percent_change_elec21_71', 'Percent_change_elec12_82', 'Percent_change_elec13_83', 'Percent_change_elec14_84', 'Percent_change_elec15_85', 'Percent_change_elec16_86', 'Percent_change_elec17_87', 'Percent_change_elec28_78'};
[pathstr,name,ext] = fileparts(fn);

for num=1:8
    H=figure(num)
    hold off
    
    R=my_legends(:,num);
    R = R(~cellfun('isempty',R)) ;
    legend(R)
    savefig(fullfile(pathstr,strcat(idx{num},'.fig')));
    
    if handles.plot_file_type.Value==2
        print(strcat('-f',num2str(num)), fullfile(pathstr,strcat(idx{num},'.png')),'-dpng');
% saveas(gcf,titlestr,'epsc')
% saveas(gcf,titlestr,'fig')
    else
%         print(strcat('-f',num2str(num)), strcat(pathstr,'\',idx{num},'.eps'),'-dwin');
        saveas(H,fullfile(pathstr,strcat(idx{num},'.eps')),'epsc')
    end
    
    close(H)
    
    
%     xlabel('Time (sec)')
%     ylabel('Peak Amplitude (units?)')

end

%MEAN+SEM+p-value (???)
%1. Calculate 
%2. Display
%3. Save
if handles.flag==1
    figure
    filename='MEAlayout.png';
    h=imshow(filename);

    idxX=[296,264,231,196,162,126,94,62];
    idxY=[38,72,105,138,173,208,242,276];
    [X,Y] = meshgrid(sort(idxX),sort(idxY));

    for ii=2:numel(X)-1
        if ~isnan(yy(1,ii-1))
            rectangle('Position',[X(ii) Y(ii) 23 23],'EdgeColor', 'g','Curvature',[1 1], 'LineWidth',5)    
        else
            rectangle('Position',[X(ii) Y(ii) 23 23],'EdgeColor', 'r','Curvature',[1 1], 'LineWidth',5)    
        end
    end
    
    savefig(fullfile(pathstr,strcat(name,'_activechs.fig')));
    saveas(h,fullfile(pathstr,strcat(name,'_activechs.eps')),'epsc');

end

spikeData=dir(fullfile(pathstr,'spike data',strcat('*','startstop.mat')))
load(fullfile(spikeData.folder,spikeData.name))
raster_spikes_all=[];
valid=[];
invalid=[];
count=0;
count02=0;
for iii=12:87
        if ~isnan(spikedatalist(iii).electrode) %rem(iii,10)~=0 && rem(iii,10)~=9
            count=count+1;
            tt=spikedatalist(iii,:);
            electrode_list_raster(iii)=spikedatalist(iii).electrode;
            for i=1:numel(tt)
                xx(i) =tt(i).Trigger;  
                raster_spike(i)=tt(i).electrode;
            end 
            raster_spikes_all=[raster_spikes_all;raster_spike];
            valid=[valid;iii];
        else
            invalid=[invalid;iii];
            count02=count02+1;

        end

end
    
hello = cell(size(raster_spike,1),1);

for ii=1:size(raster_spikes_all,1)
    hello{ii}=raster_spikes_all(ii,:)/1e6;
    
end
H=figure;
LineFormat.Color = 'b';
plotSpikeRaster_AM(hello,'SpikeDuration',0.003,'LineFormat',LineFormat,'XLimForCell',[0 275],'PlotType','vertline');

savefig(H, fullfile(pathstr,strcat(name,'_rasterplot.fig')));
saveas(H, fullfile(pathstr,strcat(name,'_rasterplot.eps')),'epsc');

% 
% content = dir('C:\Users\Awais Mansoor\Dropbox\aminah_awais\sweep data folder structure\masterpaechr2meadata\notHSE\l23\group2prelim\**\rec2\*.mat');
% 
% 
% stim=16;
% effective_row=zeros(1,stim);
% 
% for ii=2:numel(content)
%     
%    load(fullfile(content(ii).folder,content(ii).name));
%    summary_peaks=zeros(8,stim+1);
%    count=0;
%    
%    size(mydictlist,2)
%    
%     for iii=12:87
%         if rem(iii,10)~=0 && rem(iii,10)~=9
%             count=count+1;
%             tt=mydictlist(iii,:);
%             electrode_list(count)=mydictlist(iii).electrode;
%             for i=1:numel(tt)
%                 xx(i) =tt(i).time;  
%                 yy(i,count)=tt(i).peak2peak;
%             end
%             
%             [c, basline_time_idx] = min(abs(sqrt((xx-120).^2)));           %REDO
%             [c, stim_time_closest_idx] = min(abs(sqrt((xx-150).^2)));      %REDO
%             
%             if ~isnan(sum(yy(:,count)))
%                 summary_peaks(rem(electrode_list(count),10),1:stim)=summary_peaks(rem(electrode_list(count),10),1:stim)+(yy(basline_time_idx:stim_time_closest_idx,count))';
%                 summary_peaks(rem(electrode_list(count),10),stim+1)=summary_peaks(rem(electrode_list(count),10),stim+1)+1;
%             end
%             
% 
%         end
% 
%     end
%     
%     avg=summary_peaks(:,1:16)./summary_peaks(:,17);
%     stdev_gp2=std(summary_peaks(:,1:16));
%     norm=sum(avg,2)/max(sum(avg,2));
%     [~,idx]=max(norm);
%     
%     effective_row=effective_row+avg(idx,:);
%     
% end
% effective_row_gp2=effective_row/numel(content);
% scatter(1:16,effective_row_gp2,'r')
% 
% content = dir('C:\Users\Awais Mansoor\Dropbox\aminah_awais\sweep data folder structure\masterpaechr2meadata\notHSE\l23\group1prelim\**\rec2\*.mat');
% 
% stim=16;
% effective_row=zeros(1,stim);
% 
% for ii=1:numel(content)
%     
%    load(fullfile(content(ii).folder,content(ii).name));
%    summary_peaks=zeros(8,stim+1);
%    count=0;
%    
%    size(mydictlist,2)
%    
%     for iii=12:87
%         if rem(iii,10)~=0 && rem(iii,10)~=9
%             count=count+1;
%             tt=mydictlist(iii,:);
%             electrode_list(count)=mydictlist(iii).electrode;
%             for i=1:numel(tt)
%                 xx(i) =tt(i).time;  
%                 yy(i,count)=tt(i).peak2peak;
%             end
%             
%             [c, basline_time_idx] = min(abs(sqrt((xx-120).^2)));           %REDO
%             [c, stim_time_closest_idx] = min(abs(sqrt((xx-150).^2)));      %REDO
%             
%             if ~isnan(sum(yy(:,count)))
%                 summary_peaks(rem(electrode_list(count),10),1:stim)=summary_peaks(rem(electrode_list(count),10),1:stim)+(yy(basline_time_idx:stim_time_closest_idx,count))';
%                 summary_peaks(rem(electrode_list(count),10),stim+1)=summary_peaks(rem(electrode_list(count),10),stim+1)+1;
%             end
%             
% 
%         end
% 
%     end
%     
%     avg=summary_peaks(:,1:16)./summary_peaks(:,17);
%     stdev_gp1=std(summary_peaks(:,1:16));
%     norm=sum(avg,2)/max(sum(avg,2));
%     [~,idx]=max(norm);
%     
%     effective_row=effective_row+avg(idx,:);
%     
% end
% effective_row_gp1=effective_row/numel(content);
% hold on
% scatter(1:16,effective_row_gp1,'k')
% 
% vq2 = interp1(1:16,effective_row_gp1,1:0.01:16,'spline');





% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
