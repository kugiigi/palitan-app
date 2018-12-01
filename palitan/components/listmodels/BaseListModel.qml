import QtQuick 2.9


ListModel{
	id: baseListModel
	
	// finds a value from a specific role and return the index
	function find(value, role) {
		var i = 0
	
		for (i = 0; i <= count - 1; i++) {
			if (value === get(i)[role]) {
				return i
			}
		}
	
		return -1
	}
	
	// gets the item from value
	function getItem(value, role) {
		var i = find(value, role)
		return get(i)
	}
	
	// gets the value of a specific index and role
	function getValue(index, role){
		return get(index)[role]
	}
}

