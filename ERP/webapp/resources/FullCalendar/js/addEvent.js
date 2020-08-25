var eventModal = $('#eventModal'); // 모달창 띄우는 div id

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay'); // 모달에서 하루종일 체크박스 
var editTitle = $('#edit-title'); // 모달에서일정 명
var editStart = $('#edit-start');// 모달에서 일정 시작
var editEnd = $('#edit-end'); // 모달에서 일정 끝 설정부분
var editType = $('#edit-type'); // 모달창에서 구분(인사부서,회계부서...)
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent'); //  모달에서 저장 버튼 
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent'); // 일정 클릭 후 수정 버튼 


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    //새로운 모달을 눌렀을 때 기존의 모달을 없애주는거  
    modalTitle.html('새로운 일정'); // 모달의 타이틀 
    editType.val(eventType).prop('selected', true); // 모달에서 구분 선택하는거 
    editTitle.val(''); // 모달 일정명
    editStart.val(start); // 모달 일정 시작
    editEnd.val(end); // 모달에서 일정 끝
    editDesc.val(''); // 모달에서 설명 부분 
    
    addBtnContainer.show(); // 빈 네모 칸을 누르면 등록 폼 나오도록 
    modifyBtnContainer.hide(); // 네모칸의 일정을 누르면 수정,삭제 폼  나오는거
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
   // var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
//            _id: eventId,  --> insert에서 생성되는거 
     // CalendarVO에 있는 변수이름에 넣어주는거 
       // 키 : VALUE  		
        		calendar_title: editTitle.val(),
        		calendar_start: editStart.val(),
        		calendar_end: editEnd.val(),
        		calendar_content: editDesc.val(),
            type: editType.val(),
            username: '인사부서',
            background: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.calendar_start > eventData.calendar_end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.calendar_title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.calendar_start = moment(eventData.calendar_start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.calendar_end = moment(eventData.calendar_end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.calendar_end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

 		
 		var data = JSON.stringify(eventData);
 
 		var evebtArr=[]; // 달력에 나올 애
 		
        //새로운 일정 저장
        $.ajax({
            type: "POST",
            url: "/ERP/emp/register/calendar/insertSC",
            dataType : "text",
            contentType:"application/json",
            data: data,
            success: function (response) { // 컨트롤러에서 리턴하는 값을 받는거 
            	alert("저장되었습니다.")
            	
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};