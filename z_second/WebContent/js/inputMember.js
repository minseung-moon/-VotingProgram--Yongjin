function validate() {
	const
	v_jumin = document.getElementById("v_jumin");
	const
	v_name = document.getElementById("v_name");
	const
	v_num = document.getElementById("v_num");
	const
	v_time = document.getElementById("v_time");
	const
	v_area = document.getElementById("v_area");
	const
	v_confirm = document.querySelectorAll(".v_confirm");
	let
	check = false;

	if (v_jumin.value.trim() === "" || isNaN(v_jumin.value)
			|| v_jumin.value.trim().length !== 13) {
		alert("주민번호를 입력하세요!");
		v_jumin.focus();
	} else if (v_name.value.trim() === "") {
		alert("성함을 입력하세요!");
		v_name.focus();
	} else if (isNaN(v_num.value)) {
		alert("투표번호를 선택해주세요!");
		v_num.focus();
	} else if (v_time.value.trim() === "" || isNaN(v_time.value)
			|| v_time.value.trim().length !== 4) {
		alert("투표시간을 입력해주세요!");
		v_time.focus();
	} else if (v_area.value.trim() === "") {
		alert("투표장소를 입력해주세요!");
		v_area.focus();
	} else if (!v_confirm[0].checked && !v_confirm[1].checked) {
		alert("유권자확인을 해주세요!");
		v_confirm[1].focus();
	} else {
		check = true;
	}

	return check;
}