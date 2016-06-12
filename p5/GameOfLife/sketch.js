"use strict";

// Size of Board
var numColumns = 13;
var numRows = 13;
var colWidth;
var rowHeight;

// Speed of Game must be >= 1, larger number makes slower game.
var speed = 10;

// Rules
var minToLive = 2; //2
var maxToLive = 3; //3
var revive = [3]; //3

// A counter to keep track of how many iteratons of the draw() loop have been done.
var loop;

// Enum type for state
var Status = {"DEAD":0, "ALIVE":1};

// An array of cells
var cells;

/*
* The object that represents a cell on the grid.
* Has a position and an alive or dead state, as well as what state it should be next based on its alive neighbouring cells.
*/
class Cell {

	/*
	* Create a new cell. setting its positon and status.
	*/
	constructor(col, row, status) {
		this.c = col;
		this.r = row;

		this.status = status;
		this.next = status;
		this.generationsLived = 0;

		this.x = col*colWidth;
		this.y = row*rowHeight;
		
		this.left = this.minus1(this.c, numColumns);
		this.right = this.plus1(this.c, numColumns);
		this.below = this.minus1(this.r, numRows);
		this.above = this.plus1(this.r, numRows);
	}
	
	/*
	* subtract 1 from a value, wrapping around if needed.
	* @param {Number} val The current value of the coordinate
	* @param {Number} num The number of columns or rows
	* @returns val - 1, unless the edge case where its position is zero, then returns num - 1
	*/
	minus1(val, num) {
		if(val == 0) {
			return (num-1);
		}
		else{
			return (val - 1);
		}
	}

	/*
	* subtract 1 from a value, wrapping around if needed.
	* @param {Number} val The current value of the coordinate
	* @param {Number} num The number of columns or rows
	* @returns val + 1, unless the edge case where its position is equal to num, then returns 0
	*/
	plus1(val, num) {
		if(val == (num-1)) {
			return (0);
		}
		else{
			return (val + 1);
		}
	}

	/*
	* Actually show the cell on the canvas. Color it if it is alive, otherwise, it appears black.
	* color will be darker if the cell is young, more intense if old.
	*/
	drawCell() {
		if(this.status == 1){
			var intensity = (this.generationsLived*5)+40;
			if(intensity > 255){ 
				intensity = 255;
			}

			fill(0,intensity,0);
		}
		else {
			fill(0,0,0);
		}
		rect(this.x, this.y, colWidth, rowHeight);
	}
	
	/*
	* Check how many alive neighbours the current cell has. Then set it to be alive or dead for the next call to draw().
	*/
	update() {
		var numAlive = this.countAliveNeighbors();

		if(this.status == Status.ALIVE) {
			if(numAlive < minToLive || numAlive > maxToLive){
				this.next = Status.DEAD;
			}
			if(numAlive == minToLive || numAlive == maxToLive){
				this.next = Status.ALIVE;
			}
		}
		else if(this.status == Status.DEAD) {
			for(var i = 0; i <= revive.length; i++) {
				if(numAlive == revive[i]) {
					this.next = Status.ALIVE;
				}
			}
		}
		else {
			// no change
		}
	}
	
	/*
	* Called after all of the updates have been done.
	*/
	change() {
		// increment the number of generations lived if appropriate
		if(this.status == Status.ALIVE && this.next == Status.ALIVE){
			this.generationsLived++;
		}
		else {
			this.generationsLived = 0;
		}
		this.status = this.next;
	}

	/*
	* Used within the update() method.
	* @returns {Number} how many of the 8 neighbouring cells are alive
	*/
	countAliveNeighbors() {
		var aliveNeighbors = Status.DEAD;

		if( cells[this.left][this.above].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.c][this.above].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.right][this.above].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.left][this.r].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.right][this.r].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.left][this.below].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.c][this.below].status == Status.ALIVE){
			aliveNeighbors++;
		}
		if( cells[this.right][this.below].status == Status.ALIVE){
			aliveNeighbors++;
		}

		return aliveNeighbors;
	}
}


/*
* Initialize the main 2d array of cells. 
* Can set some cells to be alive, otherwise they are starting as dead.
*/
function initCells() {
	for(var i = 0; i < numColumns; i++) {
		for(var j = 0; j < numRows; j++) {
			if( (i == 2 && j == 2) ||
				(i == 3 && j == 3) ||
				(i == 4 && j == 3) ||
				(i == 4 && j == 4) ||
				(i == 4 && j == 5) ||
				(i == 3 && j == 6) ) {

				cells[i][j] = new Cell(i,j,Status.ALIVE);
			}
			else {
				cells[i][j] = new Cell(i,j,Status.DEAD);
			}
		}
	}
}

/*
* call update() on all cells
*/
function updateStatus() {
	for(var i = 0; i < numColumns; i++) {
		for(var j = 0; j < numRows; j++) {
			cells[i][j].update();
		}
	}
}

/*
* call change() on all cells
*/
function changeStatus() {
	for(var i = 0; i < numColumns; i++) {
		for(var j = 0; j < numRows; j++) {
			cells[i][j].change();
		}
	}
}

/*
* call drawCell() on all cells
*/
function drawCells() {
	for(var i = 0; i < numColumns; i++) {
		for(var j = 0; j < numRows; j++) {
			cells[i][j].drawCell();
		}
	}
}

/*
* Initialize variables.
*/
function setup() {
	
	createCanvas(500,500);
	background(255,0,0);
	
	cells = new Array;
	for( var i = 0; i < numColumns; i++) {
		cells[i] = new Array;	
	}

	colWidth = width/numColumns;
	rowHeight = height/numRows;
	
	loop = 0;

	initCells();	
	drawCells();
}

/*
* Continue to perform this routine over and over, once setup() has completed
*/
function draw() {
	
	if( 0 == loop % speed) {
		updateStatus();
		changeStatus();
		drawCells();
	}
		
	loop++;
	if(loop > 10000){
		loop = 0;
	}
}

