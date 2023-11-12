var result = [];

$(function () {
    $("#button").click(function () {
        var name = $("#question").attr('name');

        if (name == 'q1') {
            $("#question").text("2번 질문 : 어느정도 신맛을 원하시나요?");
            $("#question").attr('name', 'q2');
            result[0] = $("#answer_in").val();


            $("#answer_in").val("1");

        } else if (name == 'q2') {
            $("#question").text("3번 질문 : 어느정도 향을 원하시나요?");
            $("#question").attr('name', 'q3');
            result[1] = $("#answer_in").val();

            $("#button").attr('value', '결과 보기');

            $("#answer_in").val("1");
            
        } else if (name == 'q3') {
            $("#button").hide();
            $("#img").attr("src", "/resources/img/recmnd/loading-cat.gif");
            $("#question").text("결과를 가져오는중입니다...");
            $("#answer_in").hide();
            setTimeout(function () {
                result[2] = $("#answer_in").val();
                $("#question").text("결과가 나왔다 맨이야!");
                $("#img").attr("src", "/resources/img/recmnd/banging-tom-and-jerry.gif");
                $("#result").text("답변한 값들 : 단맛 " + result[0] + ", 신맛 " + result[1] + ", 향 " + result[2]);
                $("#button").show();
                $("#button").attr('onclick', 'location.reload();').val('처음으로');
            }, 2000);
        }
    });
});
