// Ronan reilly 2012
package 
{
	// Minicomps is imported so the comopnents
	// for the UI can be created.

	import com.bit101.components.*;
	
	import flash.display.*;
	import flash.events.*;
	import demo.DemoToneMatrix;
	import tonfall.*;
	import flash.media.SoundTransform;
	import tonfall.display.AbstractApplication;
	
	/*
		Ronan Reilly, N00090333, DL131,
		3rd Year Computing in Multimedia Programming,
		Multimedia Programming II,
		CA 2, ToneMatrix,
		March 2012
		
	*/
	
	/*
		CLASS DESCRIPTION BELOW:
	
		This class is used to set up the components for controlling the ToneMatrix and
		despatching events for each butoon or slider etc. All of the components used are
		imported from the minicomps/bit101 external library. 
			
	*/
		
	public class ControlPanel extends Sprite
	{
		// These constant variables will be passed to event listeners
		// to identify what event has been dispatched from this class.
		
		public const CP_STARTAUDIO:String = "cp_startAudio"; // to identify the start audio event
		public const CP_STOPAUDIO:String = "cp_stopAudio"; // to identify the stop audio event
		public const CP_CLEAR:String = "cp_clear"; // to identify the clear the matrix event 
		public const CP_MYGOL:String = "cp_gol"; // to identify the start game of life event
		public const CP_STOPMYGOL:String = "cp_stop_gol"; // to identify the stop audio event
		public const CP_RANDOM:String = "cp_random"; // to identify setting the matrix buttons/notes to random
		public const CP_SCALEUP:String = "cp_scaleUp"; // to identify scaling up of notes on the matrix event
		public const CP_SCALEDOWN:String = "cp_scaleDown"; // to identify scaling down of notes on the matrix event
		public const CP_BPM_SLIDER:String = "cp_change_bpm"; //  to identify change sequencer's bpm
		public const CP_HIGHERNOTES:String = "cp_make_notes_higher"; // to identify the changing of all the matrix's notes up an octave event
		public const CP_NORMALNOTES:String = "cp_make_notes_normal"; // to identify the changing of all of the matrix'x notes back to normal event
		
		//minimal comps UI components
		private var _cp:Panel; // back panel
		private var _label:Label;	// label for panel
		private var _startAudio:PushButton; // start audio button
		private var _stopAudio:PushButton; // stop audio button
		private var _clearBtn:PushButton; // clear matrix button
		private var _randomBtn:PushButton; // randomise matrix button
		private var _scaleUpBtn:PushButton; // scale up button
		private var _scaleDownBtn:PushButton; // scale down button
		private var _myGOLBtn:PushButton; // start game of life button
		private var _StopMyGOLBtn:PushButton; // stop game of life button
		private var _higherNotesBtn:PushButton; // make notes on matrix higher button
		private var _normalNotesBtn:PushButton; //  make notes normal again button
		private var _bpm_slider:HUISlider;
		
		
		// Constructor adding event listener to the stage 
		// if it is not added to the stage and 
		public function ControlPanel()
		{
			if (stage) { 
				initCP();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, 	initCP, false, 0 ,true);
			}
		}
		
		
		// In this function all of the ui components are defined and 
		// placed given their position on the control panel.
		private function initCP(evt:Event = null ){
		
			removeEventListener(Event.ADDED_TO_STAGE, initCP);
			
			trace("Control Panel Class is Initiated");
			
			// Control panel is given its attributes.
			
			_cp = new Panel(this, 10, 10);
			_cp.setSize(270, 360);
			_cp.color = 0x333333;
			_cp.shadow = true;
			_label = new Label(_cp, 97, 2, "Control Panel");
			
			
			// All of the buttons for controlling the matrix are created, given text,
			// positioned and given a handler "buttonHandler".
			
			_startAudio =  new PushButton(_cp, 85, 40, "Start Audio", buttonHandler);
			_stopAudio =  new PushButton(_cp, 85, 80, "Stop Audio", buttonHandler);
			
			_clearBtn =  new PushButton(_cp, 20, 120, "Clear", buttonHandler);
			_randomBtn = new PushButton(_cp, 150, 120, "Randomise", buttonHandler);
			_scaleUpBtn =  new PushButton(_cp, 20, 160, "Scale Up", buttonHandler);
			_scaleDownBtn =  new PushButton(_cp, 150, 160, "Scale Down", buttonHandler);
			_myGOLBtn =  new PushButton(_cp, 20, 200, "Start GOL", buttonHandler);
			_StopMyGOLBtn =  new PushButton(_cp, 150, 200, "Stop GOL", buttonHandler);
			_higherNotesBtn = new PushButton(_cp, 85, 240, "Higher Notes", buttonHandler);
			_normalNotesBtn = new PushButton(_cp, 85, 280, "Normal Notes", buttonHandler);
			
			// Slider to change the value of the bpm the matrix is playing at.
			
			_bpm_slider = new HUISlider(_cp, 45, 323, "Change The BPM", buttonHandler);
			_bpm_slider.minimum = 120;
			_bpm_slider.maximum = 4;
			_bpm_slider.tick = 2;
		
		}
		
		// This function dispatches events when a ui component is interacted with by the user.
		// Evnets for these events are handled in the DemoToneMatrixClass, where some text is passed
		// to the event listeners ie. the values of teh constants at the top of this class.
		
		private function buttonHandler(evt:Event=null):void {
			
			switch (evt.target) {
				case _startAudio:
					trace('ControlPanel: ' + 'start Matrix Audio Event Dispatched');
					dispatchEvent(new Event("cp_startAudio"));
				break;
				case _stopAudio:
					trace('ControlPanel: ' + 'stop Matrix Audio Event Dispatched');
					dispatchEvent(new Event("cp_stopAudio"));
				break;
				case _clearBtn:
					trace('ControlPanel: ' + 'Clear Matrix Event Dispatched');
					dispatchEvent(new Event("cp_clear"));
				break;
				case _randomBtn:
					trace('ControlPanel: ' + 'Randomise Matrix Event Dispatched');
					dispatchEvent(new Event("cp_random"));
				break;
				case _scaleUpBtn:
					trace('ControlPanel: ' + 'Scale Up Matrix Event Dispatched');
					dispatchEvent(new Event("cp_scaleUp"));
				break;
				case _scaleDownBtn:
					trace('ControlPanel: ' + 'Scale Down Matrix Event Dispatched');
					dispatchEvent(new Event("cp_scaleDown"));
				break;
				case _myGOLBtn:
					trace('ControlPanel: ' + 'Play GOL in Matrix Event Dispatched');
					dispatchEvent(new Event("cp_gol"));
				break;
				case _StopMyGOLBtn:
					trace('ControlPanel: ' + 'Stop GOL in Matrix Event Dispatched');
					dispatchEvent(new Event("cp_stop_gol"));
				break;
				case _higherNotesBtn:
					trace('ControlPanel: ' + 'Make Notes higher in Matrix Event Dispatched');
					dispatchEvent(new Event("cp_make_notes_higher"));
				break;
				case _normalNotesBtn:
					trace('ControlPanel: ' + 'Make Notes higher in Matrix Event Dispatched');
					dispatchEvent(new Event("cp_make_notes_normal"));
				break;
				
				case _bpm_slider:
					trace('ControlPanel: ' + 'Change The BPM Event Dispatched');
					dispatchEvent(new Event("cp_change_bpm"));
				break;
				/*case _stopBtn:
					trace('ControlPanel: ' + 'Stop the Matrix Event Dispatched');
					dispatchEvent(new Event("cp_stopSequncer"));
				break;*/
				
				/*case _bpm:
					dispatchEvent(new Event("cp_Bpm"));
				break;*/
				default:
				
			}
	  	}
	  	
		//Getter for BPM value
		public function get bpm():int {
			return _bpm_slider.value;
		}
	}
}