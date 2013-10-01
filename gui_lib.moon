export class GUIElement
	Destroy: =>
		destroyElement @gui
	Position: (x = false, y, relative) =>
		if x and y and relative then guiSetPosition @gui, x, y, relative else guiGetPosition @gui, x
	Size: (w = false, h, relative) =>
		if w and h and relative then guiSetSize @gui, w, h, relative else guiGetSize @gui, w
	Text: (text) =>
		if text and tostring text then guiSetText @gui, text else guiGetText @gui
	Visible: (visible) =>
		if visible == nil then guiGetVisible @gui else guiSetVisible @gui, visible
	Alpha: (alpha) =>
		if tonumber alpha then guiSetAlpha @gui, alpha else guiGetAlpha @gui
	Enabled: (enabled) =>
		if enabled == nil then guiGetEnabled @gui else guiSetEnabled @gui, enabled
	Property: (property, value) =>
		if property and value then
			guiSetProperty @gui, property, value
		elseif property
			guiGetProperty @gui, property
	Properties: =>
		guiGetProperties @gui
	BringToFront: =>
		guiBringToFront @gui
	MoveToBack: =>
		guiMoveToBack @gui
	AddOn: (event, callback) =>
		unless event and type(callback) == 'function' return
		switch event
			when 'Click'
				addEventHandler 'onClientGUIClick', @gui, callback, false
			when 'DoubleClick'
				addEventHandler 'onClientGUIDoubleClick', @gui, callback, false
			when 'MouseEnter'
				addEventHandler 'onClientMouseEnter', @gui, callback, false
			when 'MouseLeave'
				addEventHandler 'onClientMouseLeave', @gui, callback, false
			when 'MouseMove'
				addEventHandler 'onClientMouseMove', @gui, callback, false
			when 'MouseWheel'
				addEventHandler 'onClientMouseWheel', @gui, callback, false
			when 'MouseDown'
				addEventHandler 'onClientGUIMouseDown', @gui, callback, false
			when 'MouseUp'
				addEventHandler 'onClientGUIMouseUp', @gui, callback, false
			when 'Move'
				addEventHandler 'onClientGUIMove', @gui, callback, false
			when 'Size'
				addEventHandler 'onClientGUISize', @gui, callback, false
			when 'Focus'
				addEventHandler 'onClientGUIFocus', @gui, callback, false
			when 'Blur'
				addEventHandler 'onClientGUIBlur', @gui, callback, false

export class Window extends GUIElement
	new: (x, y, w, h, text, relative) =>
		unless x and y and w and h return
		if x == 'center'
			sw, sh = guiGetScreenSize!
			relative = text or false
			text = h
			h = w
			w = y
			x = (sw / 2) - (w / 2)
			y = (sh / 2) - (h / 2)
		@gui = guiCreateWindow x, y, w, h, text, relative
	Movable: (movable) =>
		unless movable return
		guiWindowSetMovable @gui, movable
	Sizable: (sizable) =>
		unless sizable return
		guiWindowSetSizable @gui, sizable
		
export class Button extends GUIElement
	new: (x, y, w, h, text, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateButton x, y, w, h, text, relative, parent
		
export class CheckBox extends GUIElement
	new: (x, y, w, h, text, selected, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateCheckBox x, y, w, h, text, selected, relative, parent
	Selected: (selected) =>
		if selected == nil then guiCheckBoxGetSelected @gui else guiCheckBoxSetSelected @gui, selected

export class ComboBox extends GUIElement
	new: (x, y, w, h, caption, relative, parent) =>
		unless x and y and w and h and caption return
		if parent then parent = parent.gui
		@gui = guiCreateComboBox x, y, w, h, caption, relative, parent
	AddItems: (...) =>
		if #arg < 1 return
		for i, value in ipairs arg
			guiComboBoxAddItem @gui, value
	RemoveItem: (id) =>
		unless id return
		guiComboBoxRemoveItem @gui, id
	Clear: =>
		guiComboBoxClear @gui
	ItemText: (id, text) =>
		unless id return
		if text and type(text) == 'string'
			guiComboBoxSetItemText @gui, id, text
		else
			guiComboBoxGetItemText @gui, id
	Selected: (id) =>
		if id and tonumber id
			guiComboBoxSetSelected @gui, id
		else
			guiComboBoxGetSelected @gui
	AddOnAccepted: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUIComboBoxAccepted', @gui, callback, false
	AdjustHeight: (count) =>
		unless count return
		width = self\Size!
		guiSetSize @gui, width, (count * 20) + 20, false
		
export class Edit extends GUIElement
	new: (x, y, w, h, text, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateEdit x, y, w, h, text, relative, parent
	Masked: (masked) =>
		unless masked return
		guiEditSetMasked @gui, masked
	MaxLength: (length) =>
		unless length return
		guiEditSetMaxLength @gui, length
	ReadOnly: (readonly) =>
		unless readyonly return
		guiEditSetReadOnly @gui, readonly
	CaretIndex: (index) =>
		unless index return
		guiEditSetCaretIndex @gui, index
	AddOnChanged: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUIChanged', @gui, callback, false
	AddOnAccepted: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUIAccepted', @gui, callback, false
		
export class GridList extends GUIElement
	new: (x, y, w, h, relative, parent) =>
		unless x and y and w and h return
		if parent then parent = parent.gui
		@gui = guiCreateGridList x, y, w, h, relative, parent
	AddColumn: (title, w) =>
		unless title and w return
		guiGridListAddColumn @gui, title, w
	AddRow: (...) =>
		if #arg < 1 return
		row = guiGridListAddRow @gui
		for i, v in pairs arg
			guiGridListSetItemText @gui, row, i, v, false, false
	AddSectionRow: (title) =>
		unless title return
		row = guiGridListAddRow @gui
		guiGridListSetItemText @gui, row, 1, title, true, false
	AutoSizeColumn: (index) =>
		unless index return
		guiGridListAutoSizeColumn @gui, index
	Clear: =>
		guiGridListClear @gui
	ItemData: (row, column, data) =>
		unless row and column return
		if data
			guiGridListSetItemData @gui, row, column, data
		else
			guiGridListGetItemData @gui, row, column
	ItemText: (row, column, text, section = false, number = false) =>
		unless row and column return
		if text
			guiGridListSetItemText @gui, row, column, text, section, number
		else
			guiGridListGetItemText @gui, row, column
	RowCount: =>
		guiGridListGetRowCount @gui
	SelectedItem: (row, column, reset) =>
		if row and column
			guiGridListSetSelectedItem @gui, row, column, reset
		else
			guiGridListGetSelectedItem @gui
	InsertRowAfter: (index) =>
		unless index return
		guiGridListInsertRowAfter @gui, index
	RemoveColumn: (index) =>
		unless index return
		guiGridListRemoveColumn @gui, index
	RemoveRow: (index) =>
		unless index return
		guiGridListRemoveRow @gui, index
	ScrollBars: (h, v) =>
		unless h and v return
		guiGridListSetScrollBars @gui, h, v
	SelectionMode: (mode) =>
		unless mode return
		guiGridListSetSelectionMode @gui, mode
	SortingEnabled: (enabled) =>
		unless enabled return
		guiGridListSetSortingEnabled @gui, enabled
	SelectedCount: =>
		guiGridListGetSelectedCount @gui
	SelectedItems: =>
		guiGridListGetSelectedItems @gui
	ColumnWidth: (index, width, relative) =>
		unless index and width and relative return
		guiGridListSetColumnWidth @gui, index, width, relative
	ColumnCount: =>
		guiGridListGetColumnCount @gui
	ItemColor: (row, column, r, g, b, alpha) =>
		unless row and column return
		if r and g and b
			guiGridListSetItemColor @gui, row, column, r, g, b, alpha
		else
			guiGridListGetItemColor @gui, row, column
	ColumnTitle: (index, title) =>
		unless index return
		if title
			guiGridListSetColumnTitle @gui, index, title
		else
			guiGridListGetColumnTitle @gui, index
	HorizontalScrollPosition: (pos) =>
		if pos
			guiGridListSetHorizontalScrollPosition @gui, pos
		else
			guiGridListGetHorizontalScrollPosition @gui
	VerticalScrollPosition: (pos) =>
		if pos
			guiGridListSetVerticalScrollPosition @gui, pos
		else
			guiGridListGetVerticalScrollPosition @gui

export class Memo extends GUIElement
	new: (x, y, w, h, text, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateMemo x, y, w, h, text, relative, parent
	ReadOnly: (readonly) =>
		unless readonly return
		guiMemoSetReadOnly @gui, readonly
	CaretIndex: (index) =>
		unless index return
		guiMemoSetCaretIndex @gui, index
	AddOnChanged: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUIChanged', @gui, callback, false
		
export class ProgressBar extends GUIElement
	new: (x, y, w, h, label, relative, parent) =>
		unless x and y and w and h return
		if type(label) != 'string'
			relative = label
			parent = relative
		if parent then parent = parent.gui
		@gui = guiCreateProgressBar x, y, w, h, relative, parent
		if type(label) == 'string'
			@label = Label 0, 0, w, h, "#{label}: 0%", relative, self
			@label\HorizontalAlign 'center'
			@label\VerticalAlign 'center'
			@label\Color 255, 0, 0
			@labelstr = label
	Progress: (progress) =>
		if progress
			guiProgressBarSetProgress @gui, progress
			@label\Text "#{@labelstr}:  #{math.floor progress}%"
			if progress >= 70
				@label\Color 0, 153, 0
			elseif progress >= 40
				@label\Color 255, 100, 0
			else
				@label\Color 255, 0, 0
		else
			guiProgressBarGetProgress @gui

export class RadioButton extends GUIElement
	new: (x, y, w, h, text, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateRadioButton x, y, w, h, text, relative, parent
	Selected: (selected) =>
		if selected
			guiRadioButtonSetSelected @gui, selected
		else
			guiRadioButtonGetSelected @gui

export class ScrollBar extends GUIElement
	new: (x, y, w, h, hori, relative, parent) =>
		unless x and y and w and h and hori return
		if parent then parent = parent.gui
		@gui = guiCreateScrollBar x, y, w, h, hori, relative, parent
	ScrollPosition: (pos) =>
		if pos
			guiScrollBarSetScrollPosition @gui, pos
		else
			guiScrollBarGetScrollPosition @gui
	AddOnScroll: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUIScroll', @gui, callback, false
			
export class ScrollPane extends GUIElement
	new: (x, y, w, h, relative, parent) =>
		unless x and y and w and h return
		if parent then parent = parent.gui
		@gui = guiCreateScrollPane x, y, w, h, relative, parent
	HorizontalScrollPosition: (pos) =>
		if pos
			guiScrollPaneSetHorizontalScrollPosition @gui, pos
		else
			guiScrollPaneGetHorizontalScrollPosition @gui
	VerticalScrollPosition: (pos) =>
		if pos
			guiScrollPaneSetVerticalScrollPosition @gui, pos
		else
			guiScrollPaneGetVerticalScrollPosition @gui
	ScrollBars: (h, v) =>
		unless h and v return
		guiScrollPaneSetScrollBars @gui, h, v

export class Image extends GUIElement
	new: (x, y, w, h, path, relative, parent) =>
		unless x and y and w and h and path return
		if parent then parent = parent.gui
		@gui = guiCreateStaticImage x, y, w, h, path, relative, parent
	LoadImage: (path) =>
		unless path return
		guiStaticImageLoadImage @gui, path
		
export class TabPanel extends GUIElement
	new: (x, y, w, h, relative, parent) =>
		unless x and y and w and h return
		if parent then parent = parent.gui
		@gui = guiCreateTabPanel x, y, w, h, relative, parent
	SelectedTab: (tab) =>
		if tab and tab.gui
			guiSetSelectedTab @gui, tab.gui
		else
			guiGetSelectedTab @gui

export class Tab extends GUIElement
	new: (text, parent) =>
		unless text and parent and parent.gui return
		@gui = guiCreateTab text, parent.gui
	Delete: (parent = getElementParent @gui) =>
		guiDeleteTab @gui, parent
	AddOnSwitched: (callback) =>
		unless type(callback) == 'function' return
		addEventHandler 'onClientGUITabSwitched', @gui, callback, false
		
export class Label extends GUIElement
	new: (x, y, w, h, text, relative, parent) =>
		unless x and y and w and h and text return
		if parent then parent = parent.gui
		@gui = guiCreateLabel x, y, w, h, text, relative, parent
	FontHeight: =>
		guiLabelGetFontHeight @gui
	TextExtent: =>
		guiLabelGetTextExtent @gui
	Color: (r, g, b) =>
		if r and g and b
			guiLabelSetColor @gui, r, g, b
		else
			guiLabelGetColor @gui
	HorizontalAlign: (align, wordwrap) =>
		unless align return
		guiLabelSetHorizontalAlign @gui, align, wordwrap
	VerticalAlign: (align) =>
		unless align return
		guiLabelSetVerticalAlign @gui, align
		
export createAlert = (message) ->
	unless message return
	showCursor true
	window = Window 'center', 300, 200, 'Alert'
	label = Label 10, 20, 280, 150, message, false, window
	label\HorizontalAlign 'center'
	label\VerticalAlign 'center'
	button = Button 5, 160, 290, 190, 'Close', false, window
	button\AddOn 'Click', (button, state) ->
		unless button == 'left' and state == 'up' return
		showCursor false
		window\Destroy!
	window
	
export createYesNoPrompt = (message, ycallback, ncallback) ->
	unless message and type(ycallback) == 'function' and type(ncallback) == 'function' return
	showCursor true
	window = Window 'center', 300, 200, 'Prompt'
	label = Label 10, 20, 280, 150, message, false, window
	label\HorizontalAlign 'center'
	label\VerticalAlign 'center'
	y = Button 5, 160, 137.5, 30, 'Yes', false, window
	n = Button 152.5, 160, 140, 30, 'No', false, window
	y\AddOn 'Click', (button, state) ->
		unless button == 'left' and state == 'up' return
		showCursor false
		window\Destroy!
		ycallback!
	n\AddOn 'Click', (button, state) ->
		unless button == 'left' and state == 'up' return
		showCursor false
		window\Destroy!
		ncallback!
	window
	
export createInputPrompt = (message, callback) ->
	unless message and type(callback) == 'function' return
	showCursor true
	window = Window 'center', 300, 200, 'Prompt'
	label = Label 10, 20, 280, 100, message, false, window
	label\HorizontalAlign 'center'
	label\VerticalAlign 'center'
	edit = Edit 10, 125, 280, 30, '', false, window
	button = Button 5, 160, 290, 190, 'Proceed', false, window
	button\AddOn 'Click', (button, state) ->
		unless button == 'left' and state == 'up' return
		text = edit\Text!
		if text\len! == 0
			outputChatBox 'Input is empty'
			return
		showCursor false
		callback text
		window\Destroy!
	edit\AddOnAccepted ->
		text = edit\Text!
		if text\len! == 0
			outputChatBox 'Input is empty'
			return
		showCursor false
		callback text
		window\Destroy!
	window