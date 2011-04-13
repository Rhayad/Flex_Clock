package models {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Model extends EventDispatcher {
		
		private var timerToUpdate:Timer;
		private var currentDate:Date;
		private var _timerSetNew:int = 0;
		
		public function Model() {
			
			timerToUpdate = new Timer(1000);
			timerToUpdate.addEventListener(TimerEvent.TIMER, onTimer);
			timerToUpdate.start();
		}
		
		private function onTimer(event:TimerEvent = null):void {
			currentDate = new Date();
			currentDate.setTime(currentDate.getTime() + timerSetNew * 60 * 60 * 1000);
			dispatchEvent(new Event("timeChanged"));
		}
				
		[Bindable(event="timeChanged")]
		public function get hours():Number {
			return currentDate.hours;
		}
		
		[Bindable(event="timeChanged")]
		public function get minutes():Number {
			return currentDate.minutes;
		}

		[Bindable(event="timeChanged")]
		public function get seconds():Number {
			return currentDate.seconds;
		}

		[Bindable]
		public function get timerSetNew():int
		{
			return _timerSetNew;
		}

		public function set timerSetNew(value:int):void
		{
			_timerSetNew = value;
		}

	}
}