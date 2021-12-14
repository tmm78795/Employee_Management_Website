sessionStorage.setItem("id", 2);
var url = "./mainLeaveMgt.php";

var leaveType, dateTo, dateFrom, description, status;
var data;


async function getData() {
    var res = await fetch(url);
    var data = (await res).json()

    return data;
}

async function add_Leave(){

    

    var leaveType = document.getElementById('leave_Type').value;
    var dateTo = document.getElementById('date_To').value;    
    var dateFrom = document.getElementById('date_From').value;
    var description = document.getElementById('description').value;
    var status = document.getElementById('status').value;


    data = await getData();
    var errors = [];
    var empty = false;
    var added = false;

    if(leaveType == "" || dateTo == "" || dateFrom == "" || description == "" || status == ""){
        empty = true;
        document.getElementById("error").textContent = "* Please Enter Details";
    }

    
    if(errors.length > 0 && empty == false) {
        for (var i = 0; i < errors.length; ++i) {
        document.getElementById("error").textContent += "* " + errors[i] + "<br>"; 
        

        }
    }

    if(data != "") {
        for(var i = 0; i < data.length; ++i ) {
            if (data[i]['leave_Type'] == leaveType && data[i]['date_To'] == dateTo && data[i]['date_From'] == dateFrom && data[i]['description'] == description && data[i]['status'] == status) {
                added = true;
                document.getElementById("error").textContent = "Leave already added.";
            }
        }
    }    

    if(empty == false && added == false) {

        var id = sessionStorage.getItem("id");
      
        fetch(url,{ method: 'post',
              body: JSON.stringify({"Id":data.length + 1,"leave_Type":leaveType,"date_To":dateTo,"date_From":dateFrom,
              "description":description,"status":status, "employee_id":id})
        
            }),

            document.getElementById('error').textContent = "Leave Saved Successfully";
        

    }
}

