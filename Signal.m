% Signal class made for the module Digital Signal Processing labs and for Honours Project Simulations by Peter Scheibenhoffer.
% Glasgow Caledonian University EEE course 4th year.
% Start Date: 04/10/2023
% Last modification: 05/10/2023


% Signal class has properties and functions according to the lab exercises of DSP and simulation requirements for the Honours Project.
% Properties: 
% Amplitude         Amplitude of the signal refer to Unity
% Frequency         Frequency of the signal in Hertz
% Phase             Phase shift in Degrees  
% Start_Time        Time in seconds
% Duration          Signal length in seconds
% Sample_per_Cycle  Number of sample in one period intervall
% Data_Vector       Generated values according to the properties. It can be
% generated by the "generate" function
% 
classdef Signal
    properties
        Amplitude
        Frequency
        Phase
        Start_Time
        Duration
        Sample_per_Cycle
        Data_Vector
        Time_Vector
    end

    methods
        function sig = Signal(Amplitude,Frequency,Phase,Start_Time,Duration,Sample_per_Cycle)  
            %constructor function
            sig.Amplitude = Amplitude;
            sig.Frequency = Frequency;
            sig.Phase = Phase;
            sig.Start_Time = Start_Time;
            sig.Duration = Duration;
            sig.Sample_per_Cycle = Sample_per_Cycle; 
        end

        function Y = generate_time_vector(sig)                   %Time_Vector generator
            Sampling_Frequency = sig.Frequency*sig.Sample_per_Cycle;
            End_Time = sig.Start_Time + sig.Duration;
            Y = [sig.Start_Time:(1/Sampling_Frequency):End_Time];
        end

        function Y = generate_data_vector(sig)                   %Data_Vector generator
            Phase_Rad = sig.Phase*2*pi/360;
            Y = sig.Amplitude*cos(2*pi*sig.Frequency*sig.Time_Vector+Phase_Rad);
        end


        % plotaround function plot the signal of sig around a reference point of Ref_Point with
        % a width of Range of cycles.
        % The function calculates the necessarry data from the Signal class
        % attributes

        function plotaround(sig,Ref_Point,Cycle_Amount)
            if (Ref_Point<sig.Start_Time || Ref_Point>(sig.Start_Time+sig.Duration))            
                %Checking, that the Reference point is in the Signal
                error = "Reference point outside of the Signal's Scope";
                disp(error)
            else
                zero_idx = abs(sig.Start_Time)*sig.Frequency*sig.Sample_per_Cycle+1 ;
                cycle_idx = Cycle_Amount*sig.Sample_per_Cycle;
                index_of_interest = round(zero_idx-cycle_idx/2):round(zero_idx+cycle_idx/2);
                interval_of_interest = sig.Time_Vector(index_of_interest);
                sig_of_interest = sig.Data_Vector(index_of_interest);
                plot(interval_of_interest,sig_of_interest)
            end

        end

    end
end