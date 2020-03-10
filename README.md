# Print Tools Js
[![Build Status](https://travis-ci.org/edmundpf/print_tools_js.svg?branch=master)](https://travis-ci.org/edmundpf/print_tools_js)
[![npm version](https://badge.fury.io/js/print-tools-js.svg)](https://badge.fury.io/js/print-tools-js)
<img src="demo.jpg?raw=true"></img>
> Easy-to-use console logging presets and formatting. ✏️😋
## Install
* `npm i -S print-tools-js`
## Usage
``` javascript
var p = require('print-tools-js')
p.success('Test passed!')
```
## Methods
* Preset methods
	* Prints text with respective preset wrapper
	* Method names
		* **success()**
			* Includes green check character ✔ and blush emoji 😊
		* **info()**
			* Includes blue info character ℹ and thinking emoji 🤔
		* **warning()**
			* Includes warning character ⚠, yellow "Warning" dialog, and sweating emoji 😓
		* **error()**
			* Includes skull character 💀, red "ERROR" dialog, and fearful emoji 😨
	* Arguments
		* *text* (string) - Text to print
		* *args* (Object) - additional **optional** arguments
			* *dec* (string = 'none') - preceding text decorator, includes ['arrow', 'chevron', 'bullet']
			* *indent* (Number = 0) - number of indentation preceding text
			* *offset* (Number = 0) - characters to offset time log at end of line, useful for printing irregular unicode characters
			* *log* (Boolean = true) - if true includes log string at end of line
			* *emoji* (Boolean = true) - if true includes respective emoji at end of line
			* *ret* (Boolean = false) - if true returns formatted string, returns true after printing otherwise
	* Example
		``` javascript
		p.error('Test', { dec: 'chevron', indent: 1, offset: 1, log: true, emoji: true, ret: false })
		```
* Decorator Methods
	* Prints text with respective preceding decorator
	* Method names
		* **arrow()**
			* Includes '--->' before text
		* **chevron()**
			* Includes '>>>' before text
		* **bullet()**
			* Includes '•' before text
	* Arguments
		* *text* (string) - Text to print
		* *args* (Object) - additional **optional** arguments
			* *indent* (Number = 0) - number of indentation preceding text
			* *log* (Boolean = true) - if true includes log string at end of line
			* *ret* (Boolean = false) - if true returns formatted string, returns true after printing otherwise
	* Example
		``` javascript
		p.bullet('Test', { indent: 1, log: false, ret: true })
		```
* Log Method
	* Prints text with time log at end of line (and optional emotional emoji before time)
	* Method name
		* **log()**
	* Arguments
		* *text* (string) - Text to print	
		* *args* (Object) - additional **optional** arguments
			* *ret* (Boolean = false) - if true returns formatted string, returns true after printing otherwise
			* *offset* (Number = 0 || 1) - characters to offset time log at end of line, useful for printing irregular unicode characters
			* *emoji* (String/Boolean) - defaults to Boolean = false, if not false is a string, will print respective emoji
	* Example
	``` javascript
	p.log('Test', { offset: 0, emoji: 'thumbsup', ret=false })
	```
* Title Box Method
	* Prints title box with preset optional fields
	* Method name
		* **titleBox()**
	* Arguments
		* *title* (string) - Title to print
		* *args* (Object) - additional **optional** arguments
			* *theme* (string = 'main') - box/title color theme, includes ['main', 'success', 'info', 'warning', 'danger']
				* *main* defaults to cyan color
			* *titleDesc* (string) - Description printed next to title
			* *tagLine* (string) - Tag line printed below title line in grey
			* *author* (string) - Author name
			* *email* (string) - Author email
			* *ret* (Boolean = false) - if true returns formatted string, returns true after printing otherwise
		