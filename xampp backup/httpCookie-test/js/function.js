$(document).ready(() => {
    $('#btn_set').on('click', () => {
        //initialize
        let cookie_value = $('#cookie_value').val();
        let option = "set_jwt";

        if (cookie_value === "") {
            alert("Write a cookie value please!");
        } else {
            var payload = {
                cookie_value,
                option
            }
            axios.post(getCookie_url, JSON.stringify(payload), {
                    headers: {
                        'Authorization': 'MY_AUTHORITY'
                    }
                })
                .then((res) => {
                    console.log(res.data);
                }).catch((err) => {
                    console.log(err.data);
                })

        }
    })
    $('#btn_get').on('click', () => {
        //initialize
        let option = "get_jwt";

        if (cookie_value === "") {
            alert("Write a cookie value please!");
        } else {
            var payload = {
                option
            }
            axios.post(getCookie_url, JSON.stringify(payload), {
                    headers: {
                        'Authorization': 'MY_AUTHORITY',
                        'x-refresh-token':localStorage.getItem('refresh-token')
                    }
                })
                .then((res) => {
                    console.log(res.data);
                }).catch((err) => {
                    console.log(err.data);
                })

        }
    })
//    $('#btn_redirect').on('click', () => {
//        console.log(sessionStorage.getItem('key'));
//        //sessionstorage only exists for the duration the window browser is open,
//        //use it to store
//        //        sessionStorage.setItem('key', 'it is now changed!');
//        //        window.location.href = 'http://localhost/httpCookie-test/new_page.php';
//        //        axios.get(verifyCookie_url)
//        //            .then((res) => {
//        //                console.log(res.data);
//        //            }).catch((err) => {
//        //                console.log(err.data);
//        //            })
//    })
})
