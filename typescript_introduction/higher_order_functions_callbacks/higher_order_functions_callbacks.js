var dbQuery = function () {
    setTimeout(() => {
        console.log('Query results');
    }, 3000);
};
function loadPage(q) {
    console.log('Header');
    q();
    console.log('Sidebar');
    console.log('Footer');
}
loadPage(dbQuery);
//# sourceMappingURL=higher_order_functions_callbacks.js.map