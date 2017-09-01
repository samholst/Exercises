// Using the strict process or syntax
"use strict";
// sudo npm install typings --global
// sudo typings install dt~es6-promise dt~es6-collections --global --save
// Start mowing -> Pending
// Complete mowing process -> Resolve
// Did not complete mowing process -> Reject
let performUpload = function (imgStatus) {
    return new Promise((resolve) => {
        console.log(`Status: ${imgStatus}`);
        setTimeout(() => {
            resolve({ imgStatus: imgStatus });
        }, 1000);
    });
};
var upload;
var compress;
var transfer;
// res => short for response
performUpload('uploading...')
    .then((res) => {
    upload = res;
    return performUpload('compressing...');
})
    .then((res) => {
    compress = res;
    return performUpload('transferring...');
})
    .then((res) => {
    transfer = res;
    return performUpload('Image upload completed.');
});
//# sourceMappingURL=promises.js.map