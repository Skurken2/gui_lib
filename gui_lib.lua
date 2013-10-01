do
  local _base_0 = {
    Destroy = function(self)
      return destroyElement(self.gui)
    end,
    Position = function(self, x, y, relative)
      if x == nil then
        x = false
      end
      if x and y and relative then
        return guiSetPosition(self.gui, x, y, relative)
      else
        return guiGetPosition(self.gui, x)
      end
    end,
    Size = function(self, w, h, relative)
      if w == nil then
        w = false
      end
      if w and h and relative then
        return guiSetSize(self.gui, w, h, relative)
      else
        return guiGetSize(self.gui, w)
      end
    end,
    Text = function(self, text)
      if text and tostring(text) then
        return guiSetText(self.gui, text)
      else
        return guiGetText(self.gui)
      end
    end,
    Visible = function(self, visible)
      if visible == nil then
        return guiGetVisible(self.gui)
      else
        return guiSetVisible(self.gui, visible)
      end
    end,
    Alpha = function(self, alpha)
      if tonumber(alpha) then
        return guiSetAlpha(self.gui, alpha)
      else
        return guiGetAlpha(self.gui)
      end
    end,
    Enabled = function(self, enabled)
      if enabled == nil then
        return guiGetEnabled(self.gui)
      else
        return guiSetEnabled(self.gui, enabled)
      end
    end,
    Property = function(self, property, value)
      if property and value then
        return guiSetProperty(self.gui, property, value)
      elseif property then
        return guiGetProperty(self.gui, property)
      end
    end,
    Properties = function(self)
      return guiGetProperties(self.gui)
    end,
    BringToFront = function(self)
      return guiBringToFront(self.gui)
    end,
    MoveToBack = function(self)
      return guiMoveToBack(self.gui)
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      local _exp_0 = event
      if 'Click' == _exp_0 then
        return addEventHandler('onClientGUIClick', self.gui, callback, false)
      elseif 'DoubleClick' == _exp_0 then
        return addEventHandler('onClientGUIDoubleClick', self.gui, callback, false)
      elseif 'MouseEnter' == _exp_0 then
        return addEventHandler('onClientMouseEnter', self.gui, callback, false)
      elseif 'MouseLeave' == _exp_0 then
        return addEventHandler('onClientMouseLeave', self.gui, callback, false)
      elseif 'MouseMove' == _exp_0 then
        return addEventHandler('onClientMouseMove', self.gui, callback, false)
      elseif 'MouseWheel' == _exp_0 then
        return addEventHandler('onClientMouseWheel', self.gui, callback, false)
      elseif 'MouseDown' == _exp_0 then
        return addEventHandler('onClientGUIMouseDown', self.gui, callback, false)
      elseif 'MouseUp' == _exp_0 then
        return addEventHandler('onClientGUIMouseUp', self.gui, callback, false)
      elseif 'Move' == _exp_0 then
        return addEventHandler('onClientGUIMove', self.gui, callback, false)
      elseif 'Size' == _exp_0 then
        return addEventHandler('onClientGUISize', self.gui, callback, false)
      elseif 'Focus' == _exp_0 then
        return addEventHandler('onClientGUIFocus', self.gui, callback, false)
      elseif 'Blur' == _exp_0 then
        return addEventHandler('onClientGUIBlur', self.gui, callback, false)
      end
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "GUIElement"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  GUIElement = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Movable = function(self, movable)
      if not (movable) then
        return 
      end
      return guiWindowSetMovable(self.gui, movable)
    end,
    Sizable = function(self, sizable)
      if not (sizable) then
        return 
      end
      return guiWindowSetSizable(self.gui, sizable)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative)
      if not (x and y and w and h) then
        return 
      end
      if x == 'center' then
        local sw, sh = guiGetScreenSize()
        relative = text or false
        text = h
        h = w
        w = y
        x = (sw / 2) - (w / 2)
        y = (sh / 2) - (h / 2)
      end
      self.gui = guiCreateWindow(x, y, w, h, text, relative)
    end,
    __base = _base_0,
    __name = "Window",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Window = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateButton(x, y, w, h, text, relative, parent)
    end,
    __base = _base_0,
    __name = "Button",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Button = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Selected = function(self, selected)
      if selected == nil then
        return guiCheckBoxGetSelected(self.gui)
      else
        return guiCheckBoxSetSelected(self.gui, selected)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, selected, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateCheckBox(x, y, w, h, text, selected, relative, parent)
    end,
    __base = _base_0,
    __name = "CheckBox",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  CheckBox = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    AddItems = function(self, ...)
      if #arg < 1 then
        return 
      end
      for i, value in ipairs(arg) do
        guiComboBoxAddItem(self.gui, value)
      end
    end,
    RemoveItem = function(self, id)
      if not (id) then
        return 
      end
      return guiComboBoxRemoveItem(self.gui, id)
    end,
    Clear = function(self)
      return guiComboBoxClear(self.gui)
    end,
    ItemText = function(self, id, text)
      if not (id) then
        return 
      end
      if text and type(text) == 'string' then
        return guiComboBoxSetItemText(self.gui, id, text)
      else
        return guiComboBoxGetItemText(self.gui, id)
      end
    end,
    Selected = function(self, id)
      if id and tonumber(id) then
        return guiComboBoxSetSelected(self.gui, id)
      else
        return guiComboBoxGetSelected(self.gui)
      end
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      if event == 'Accepted' then
        return addEventHandler('onClientGUIComboBoxAccepted', self.gui, callback, false)
      end
    end,
    AdjustHeight = function(self, count)
      if not (count) then
        return 
      end
      local width = self:Size()
      return guiSetSize(self.gui, width, (count * 20) + 20, false)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, caption, relative, parent)
      if not (x and y and w and h and caption) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateComboBox(x, y, w, h, caption, relative, parent)
    end,
    __base = _base_0,
    __name = "ComboBox",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ComboBox = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Masked = function(self, masked)
      if not (masked) then
        return 
      end
      return guiEditSetMasked(self.gui, masked)
    end,
    MaxLength = function(self, length)
      if not (length) then
        return 
      end
      return guiEditSetMaxLength(self.gui, length)
    end,
    ReadOnly = function(self, readonly)
      if not (readyonly) then
        return 
      end
      return guiEditSetReadOnly(self.gui, readonly)
    end,
    CaretIndex = function(self, index)
      if not (index) then
        return 
      end
      return guiEditSetCaretIndex(self.gui, index)
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      if event == 'Changed' then
        return addEventHandler('onClientGUIChanged', self.gui, callback, false)
      elseif event == 'Accepted' then
        return addEventHandler('onClientGUIAccepted', self.gui, callback, false)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateEdit(x, y, w, h, text, relative, parent)
    end,
    __base = _base_0,
    __name = "Edit",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Edit = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    AddColumn = function(self, title, w)
      if not (title and w) then
        return 
      end
      return guiGridListAddColumn(self.gui, title, w)
    end,
    AddRow = function(self, ...)
      if #arg < 1 then
        return 
      end
      local row = guiGridListAddRow(self.gui)
      for i, v in pairs(arg) do
        guiGridListSetItemText(self.gui, row, i, v, false, false)
      end
    end,
    AddSectionRow = function(self, title)
      if not (title) then
        return 
      end
      local row = guiGridListAddRow(self.gui)
      return guiGridListSetItemText(self.gui, row, 1, title, true, false)
    end,
    AutoSizeColumn = function(self, index)
      if not (index) then
        return 
      end
      return guiGridListAutoSizeColumn(self.gui, index)
    end,
    Clear = function(self)
      return guiGridListClear(self.gui)
    end,
    ItemData = function(self, row, column, data)
      if not (row and column) then
        return 
      end
      if data then
        return guiGridListSetItemData(self.gui, row, column, data)
      else
        return guiGridListGetItemData(self.gui, row, column)
      end
    end,
    ItemText = function(self, row, column, text, section, number)
      if section == nil then
        section = false
      end
      if number == nil then
        number = false
      end
      if not (row and column) then
        return 
      end
      if text then
        return guiGridListSetItemText(self.gui, row, column, text, section, number)
      else
        return guiGridListGetItemText(self.gui, row, column)
      end
    end,
    RowCount = function(self)
      return guiGridListGetRowCount(self.gui)
    end,
    SelectedItem = function(self, row, column, reset)
      if row and column then
        return guiGridListSetSelectedItem(self.gui, row, column, reset)
      else
        return guiGridListGetSelectedItem(self.gui)
      end
    end,
    InsertRowAfter = function(self, index)
      if not (index) then
        return 
      end
      return guiGridListInsertRowAfter(self.gui, index)
    end,
    RemoveColumn = function(self, index)
      if not (index) then
        return 
      end
      return guiGridListRemoveColumn(self.gui, index)
    end,
    RemoveRow = function(self, index)
      if not (index) then
        return 
      end
      return guiGridListRemoveRow(self.gui, index)
    end,
    ScrollBars = function(self, h, v)
      if not (h and v) then
        return 
      end
      return guiGridListSetScrollBars(self.gui, h, v)
    end,
    SelectionMode = function(self, mode)
      if not (mode) then
        return 
      end
      return guiGridListSetSelectionMode(self.gui, mode)
    end,
    SortingEnabled = function(self, enabled)
      if not (enabled) then
        return 
      end
      return guiGridListSetSortingEnabled(self.gui, enabled)
    end,
    SelectedCount = function(self)
      return guiGridListGetSelectedCount(self.gui)
    end,
    SelectedItems = function(self)
      return guiGridListGetSelectedItems(self.gui)
    end,
    ColumnWidth = function(self, index, width, relative)
      if not (index and width and relative) then
        return 
      end
      return guiGridListSetColumnWidth(self.gui, index, width, relative)
    end,
    ColumnCount = function(self)
      return guiGridListGetColumnCount(self.gui)
    end,
    ItemColor = function(self, row, column, r, g, b, alpha)
      if not (row and column) then
        return 
      end
      if r and g and b then
        return guiGridListSetItemColor(self.gui, row, column, r, g, b, alpha)
      else
        return guiGridListGetItemColor(self.gui, row, column)
      end
    end,
    ColumnTitle = function(self, index, title)
      if not (index) then
        return 
      end
      if title then
        return guiGridListSetColumnTitle(self.gui, index, title)
      else
        return guiGridListGetColumnTitle(self.gui, index)
      end
    end,
    HorizontalScrollPosition = function(self, pos)
      if pos then
        return guiGridListSetHorizontalScrollPosition(self.gui, pos)
      else
        return guiGridListGetHorizontalScrollPosition(self.gui)
      end
    end,
    VerticalScrollPosition = function(self, pos)
      if pos then
        return guiGridListSetVerticalScrollPosition(self.gui, pos)
      else
        return guiGridListGetVerticalScrollPosition(self.gui)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, relative, parent)
      if not (x and y and w and h) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateGridList(x, y, w, h, relative, parent)
    end,
    __base = _base_0,
    __name = "GridList",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  GridList = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    ReadOnly = function(self, readonly)
      if not (readonly) then
        return 
      end
      return guiMemoSetReadOnly(self.gui, readonly)
    end,
    CaretIndex = function(self, index)
      if not (index) then
        return 
      end
      return guiMemoSetCaretIndex(self.gui, index)
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      if event == 'Changed' then
        return addEventHandler('onClientGUIChanged', self.gui, callback, false)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateMemo(x, y, w, h, text, relative, parent)
    end,
    __base = _base_0,
    __name = "Memo",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Memo = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Progress = function(self, progress)
      if progress then
        guiProgressBarSetProgress(self.gui, progress)
        self.label:Text(tostring(self.labelstr) .. ":  " .. tostring(math.floor(progress)) .. "%")
        if progress >= 70 then
          return self.label:Color(0, 153, 0)
        elseif progress >= 40 then
          return self.label:Color(255, 100, 0)
        else
          return self.label:Color(255, 0, 0)
        end
      else
        return guiProgressBarGetProgress(self.gui)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, label, relative, parent)
      if not (x and y and w and h) then
        return 
      end
      if type(label) ~= 'string' then
        relative = label
        parent = relative
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateProgressBar(x, y, w, h, relative, parent)
      if type(label) == 'string' then
        self.label = Label(0, 0, w, h, tostring(label) .. ": 0%", relative, self)
        self.label:HorizontalAlign('center')
        self.label:VerticalAlign('center')
        self.label:Color(255, 0, 0)
        self.labelstr = label
      end
    end,
    __base = _base_0,
    __name = "ProgressBar",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ProgressBar = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Selected = function(self, selected)
      if selected then
        return guiRadioButtonSetSelected(self.gui, selected)
      else
        return guiRadioButtonGetSelected(self.gui)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateRadioButton(x, y, w, h, text, relative, parent)
    end,
    __base = _base_0,
    __name = "RadioButton",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  RadioButton = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    ScrollPosition = function(self, pos)
      if pos then
        return guiScrollBarSetScrollPosition(self.gui, pos)
      else
        return guiScrollBarGetScrollPosition(self.gui)
      end
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      if event == 'Scroll' then
        return addEventHandler('onClientGUIScroll', self.gui, callback, false)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, hori, relative, parent)
      if not (x and y and w and h and hori) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateScrollBar(x, y, w, h, hori, relative, parent)
    end,
    __base = _base_0,
    __name = "ScrollBar",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ScrollBar = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    HorizontalScrollPosition = function(self, pos)
      if pos then
        return guiScrollPaneSetHorizontalScrollPosition(self.gui, pos)
      else
        return guiScrollPaneGetHorizontalScrollPosition(self.gui)
      end
    end,
    VerticalScrollPosition = function(self, pos)
      if pos then
        return guiScrollPaneSetVerticalScrollPosition(self.gui, pos)
      else
        return guiScrollPaneGetVerticalScrollPosition(self.gui)
      end
    end,
    ScrollBars = function(self, h, v)
      if not (h and v) then
        return 
      end
      return guiScrollPaneSetScrollBars(self.gui, h, v)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, relative, parent)
      if not (x and y and w and h) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateScrollPane(x, y, w, h, relative, parent)
    end,
    __base = _base_0,
    __name = "ScrollPane",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ScrollPane = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    LoadImage = function(self, path)
      if not (path) then
        return 
      end
      return guiStaticImageLoadImage(self.gui, path)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, path, relative, parent)
      if not (x and y and w and h and path) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateStaticImage(x, y, w, h, path, relative, parent)
    end,
    __base = _base_0,
    __name = "Image",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Image = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    SelectedTab = function(self, tab)
      if tab and tab.gui then
        return guiSetSelectedTab(self.gui, tab.gui)
      else
        return guiGetSelectedTab(self.gui)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, relative, parent)
      if not (x and y and w and h) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateTabPanel(x, y, w, h, relative, parent)
    end,
    __base = _base_0,
    __name = "TabPanel",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  TabPanel = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    Delete = function(self, parent)
      if parent == nil then
        parent = getElementParent(self.gui)
      end
      return guiDeleteTab(self.gui, parent)
    end,
    AddOn = function(self, event, callback)
      if not (event and type(callback) == 'function') then
        return 
      end
      if event == 'Switched' then
        return addEventHandler('onClientGUITabSwitched', self.gui, callback, false)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, text, parent)
      if not (text and parent and parent.gui) then
        return 
      end
      self.gui = guiCreateTab(text, parent.gui)
    end,
    __base = _base_0,
    __name = "Tab",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Tab = _class_0
end
do
  local _parent_0 = GUIElement
  local _base_0 = {
    FontHeight = function(self)
      return guiLabelGetFontHeight(self.gui)
    end,
    TextExtent = function(self)
      return guiLabelGetTextExtent(self.gui)
    end,
    Color = function(self, r, g, b)
      if r and g and b then
        return guiLabelSetColor(self.gui, r, g, b)
      else
        return guiLabelGetColor(self.gui)
      end
    end,
    HorizontalAlign = function(self, align, wordwrap)
      if not (align) then
        return 
      end
      return guiLabelSetHorizontalAlign(self.gui, align, wordwrap)
    end,
    VerticalAlign = function(self, align)
      if not (align) then
        return 
      end
      return guiLabelSetVerticalAlign(self.gui, align)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, x, y, w, h, text, relative, parent)
      if not (x and y and w and h and text) then
        return 
      end
      if parent then
        parent = parent.gui
      end
      self.gui = guiCreateLabel(x, y, w, h, text, relative, parent)
    end,
    __base = _base_0,
    __name = "Label",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Label = _class_0
end
createAlert = function(message)
  if not (message) then
    return 
  end
  showCursor(true)
  local window = Window('center', 300, 200, 'Alert')
  local label = Label(10, 20, 280, 150, message, false, window)
  label:HorizontalAlign('center')
  label:VerticalAlign('center')
  local button = Button(5, 160, 290, 190, 'Close', false, window)
  button:AddOn('Click', function(button, state)
    if not (button == 'left' and state == 'up') then
      return 
    end
    showCursor(false)
    return window:Destroy()
  end)
  return window
end
createYesNoPrompt = function(message, ycallback, ncallback)
  if not (message and type(ycallback) == 'function' and type(ncallback) == 'function') then
    return 
  end
  showCursor(true)
  local window = Window('center', 300, 200, 'Prompt')
  local label = Label(10, 20, 280, 150, message, false, window)
  label:HorizontalAlign('center')
  label:VerticalAlign('center')
  local y = Button(5, 160, 137.5, 30, 'Yes', false, window)
  local n = Button(152.5, 160, 140, 30, 'No', false, window)
  y:AddOn('Click', function(button, state)
    if not (button == 'left' and state == 'up') then
      return 
    end
    showCursor(false)
    window:Destroy()
    return ycallback()
  end)
  n:AddOn('Click', function(button, state)
    if not (button == 'left' and state == 'up') then
      return 
    end
    showCursor(false)
    window:Destroy()
    return ncallback()
  end)
  return window
end
createInputPrompt = function(message, callback)
  if not (message and type(callback) == 'function') then
    return 
  end
  showCursor(true)
  local window = Window('center', 300, 200, 'Prompt')
  local label = Label(10, 20, 280, 100, message, false, window)
  label:HorizontalAlign('center')
  label:VerticalAlign('center')
  local edit = Edit(10, 125, 280, 30, '', false, window)
  local button = Button(5, 160, 290, 190, 'Proceed', false, window)
  button:AddOn('Click', function(button, state)
    if not (button == 'left' and state == 'up') then
      return 
    end
    local text = edit:Text()
    if text:len() == 0 then
      outputChatBox('Input is empty')
      return 
    end
    showCursor(false)
    callback(text)
    return window:Destroy()
  end)
  edit:AddOnAccepted(function()
    local text = edit:Text()
    if text:len() == 0 then
      outputChatBox('Input is empty')
      return 
    end
    showCursor(false)
    callback(text)
    return window:Destroy()
  end)
  return window
end
