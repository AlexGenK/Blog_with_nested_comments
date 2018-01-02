function kindCheck() {
    if (document.getElementById('post_kind_event').checked) {
        document.getElementById('post_date').style.visibility = 'visible';
    }
    else document.getElementById('post_date').style.visibility = 'hidden';
};