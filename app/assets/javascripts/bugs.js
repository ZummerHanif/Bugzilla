
  function populateBugStatus(bugTypeSelectId, bugStatusSelectId) {
    var bugTypeSelect = document.getElementById(bugTypeSelectId);
    var bugStatusSelect = document.getElementById(bugStatusSelectId);

    bugStatusSelect.innerHTML = "";

    if (bugTypeSelect.value === "feature") {
      var optionArray = ['new|New', 'started|Started','completed|Completed'];
    } else if (bugTypeSelect.value === 'bug') {
      var optionArray = ['new|New', 'started|Started', 'resolved|Resolved'];
    }

    for (var option of optionArray) {
      var [value, text] = option.split("|");
      var newOption = document.createElement("option");
      newOption.value = value;
      newOption.innerHTML = text;
      bugStatusSelect.options.add(newOption);
    }
  }
