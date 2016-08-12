/**
 * Created by liu on 8/9/16.
 * arrange my bookmarks...
 */

/*
Step:
1. create folder MESS, get MESS Id;
2. move all bookmarks to MESS folder;
3. remove duplicate urls and empty folders;
4. create third class folders. (second class means
its nest depth is 3, here, Bookmarks Bar is in depth 1.)
Then move bookmarks related into them.
5. create second class folders. Then move bookmarks
related into them.

However, it is just a script now. I have to modify some code before execute it.
Don't know how to write Javascript. So sad. ;-(
 */

if (localStorage.MESSID) {
    //console.log("MESSID = " + localStorage.MESSID);
//2.
//    moveAllBookmarks2MESS('0');
//3.
//    removeEmptyFoldersDuplicateURLs('0', {});
    //if (localStorage.secondRun) {
    //    console.log("liu xue yang");
    //    localStorage.secondRun = true;
    //    console.log("second run.");
    //}
}
else {
// if we didn't create before
//1.
    folderExistsOrCreate("MESS");
    setTimeout(getMESSFolderId, 1000);
}

chrome.bookmarks.getSubTree(localStorage.MESSID, function (bookmarkArray) {
    console.log("Size: " + bookmarkArray[0].children.length);
});

//4.

var folderList = [
    //1. ////////////////////////
    ['Blog' , ['blog','cnblogs','csdn', '博客园', '博客', 'wordpress', '关于我', 'About']],
    ['BaiDu' , ['baidu', '百度']] ,

    ['ZhiHu' , ['zhihu']] ,
    ['Quora' , ['quora']] ,
    ['SegmentFault' , ['SegmentFault']] ,
    ['StackOverflow' , ['stackoverflow','stackexchange']] ,

    ['Course' , ['coursera','Edx']],
    ['V2EX' , ['V2EX']] ,
    ['Jianshu' , ['jianshu']],
    ['Github' , ['github']],

    //2. ////////////////////////
    ['Emacs' , ['emacs']] ,
    ['Linux' , ['linux','opensuse','gentoo', 'LinuxTOY', 'archlinux', 'ubuntu', 'linuxfromscratch', 'raspberry']] ,
    ['Vim' , ['vim']],
    //3. ////////////////////////
    ['Algorithm' , ['onlinejudge', 'topcoder', 'codeforces', 'spoj', 'acm', 'ICPC',
        'timus', 'NOCOW', 'codechef', 'algorithm','线段树', '背包', 'geeksforgeeks', '算法']] ,
    //4. ////////////////////////
    ['Hack' , ['hack', 'kali', 'security', 'hacker', '安全']] ,
    //5. ////////////////////////
    ['Lisp' , ['lisp','scheme','sicp', 'cliki', 'lambda', 'gigamonkeys']] ,
    ['Python' , ['python']] ,
    ['Perl' , ['perl']] ,
    ['Ruby' , ['ruby']] ,
    ['LaTex' , ['latex']] ,
    ['Shell' , ['shell','bash','zsh','fish']] ,
    ['MarkDown' , ['markdown']] ,
    ['Haskell' , ['haskell']]
];


//create3rdClassFoldersAndMoveBookmarks2Them();
//5.
//create2ndClassFoldersAndMoveBookmarks2Them();

// ############################################################
// ############################################################
// ############################################################

// 1.
function getMESSFolderId() {
    /*
     get folder MESS id.
     */
    chrome.bookmarks.search('MESS', function (bookmarkArray) {
        for (var i = 0; i < bookmarkArray.length; ++i) {
            if (!bookmarkArray[i].url) {
                localStorage.MESSID = bookmarkArray[i].id;
                console.log(localStorage.MESSID);
            }
        }
    });
}

// 2.
function moveAllBookmarks2MESS(id) {
    /*
     id = '1' on the first call to this function
     This functions move all functions to folder 'ALL'
     its id is 1022
     */

    chrome.bookmarks.getSubTree(id, function (bookmarkArray) {
        for (var i = 0; i < bookmarkArray.length; ++i) {
            //console.log(bookmarkArray[i].id + " " + bookmarkArray[i].title);

            var children = bookmarkArray[i].children;

            if (children) {
                for (var j = 0; j < children.length; ++j) {
                    if (children[j].url) {
                        // move url to ALL
                        chrome.bookmarks.move(children[j].id, {
                            parentId: localStorage.MESSID,
                            index: 0
                        }, function(bookmark) {
                        });
                    }
                    else {
                        moveAllBookmarks2MESS(children[j].id);
                    }
                }
            }
        }
    });
}

// 3.
function removeEmptyFoldersDuplicateURLs(id, dict) {
    /*
     id = 1, dict = {} in the first call.
     remove empty folders
     remove duplicate urls
     */
    chrome.bookmarks.getSubTree(id, function (bookmarkArray) {
        for (var i = 0; i < bookmarkArray.length; ++i) {
            var children = bookmarkArray[i].children;

            if (children) {
                for (var j = 0; j < children.length; ++j) {
                    if (children[j].url) {
                        if (dict[children[j].url]) {
                            //console.log(children[j].url + " alread exists and it is removed");
                            chrome.bookmarks.remove(children[j].id, function(bookmark){ });
                        }
                        else {
                            dict[children[j].url] = 1;
                        }
                    }
                    else {
                        // delete empty folders except MESS

                        if (children[j].id != localStorage.MESSID &&
                            children[j].children.length == 0 &&
                            children[j].id != 0 &&
                        children[j].id != 2) {
                            //console.log("removing " + children[j].title + " id = " + children[j].id);
                            chrome.bookmarks.remove(children[j].id, function(bookmark){ });
                        }
                        else {
                            removeEmptyFoldersDuplicateURLs(children[j].id, dict);
                        }
                    }
                }
            }
        }
    });
}

// 4.
function create3rdClassFoldersAndMoveBookmarks2Them() {
    /*
     make folders under ID 1
     move bookmarks to those folders
     */

    var nameList = folderList.slice(0, 1);

    //var i = 0, len = nameList.length;
    //
    //$('#create').on('click', function() {
    //    console.log("i = " + i);
    //    var e = nameList[i];
    //    var fold = e[0];
    //
    //    console.log("i = " + i + " item = " + nameList[i]);
    //
    //    folderExistsOrCreate(fold);
    //
    //    processArray(e[1], function (regStr) {
    //        $('#move').on('click', function() {
    //            moveBookmarks2Folder(fold, regStr);
    //        });
    //    });
    //
    //    i++;
    //
    //    if (i == len) {
    //        console.log("End of list");
    //    }
    //});
    //
    //$('#again').on('click', function() {
    //    i--;
    //    console.log("minus i " + i);
    //});


    //setTimeout(processArray, 10000, nameList, function (e) {
    //    var fold = e[0];
    //    folderExistsOrCreate(fold);
    //    processArray(e[1], function (regStr) {
    //        moveBookmarks2Folder(fold, regStr);
    //    });
    //});

    processArray(nameList, function (e) {
        var fold = e[0];
        folderExistsOrCreate(fold);

        processArray(e[1], function (regStr) {
            moveBookmarks2Folder(fold, regStr);
        });
    });
}

// 5.
function create2ndClassFoldersAndMoveBookmarks2Them() {
    /*
    create folders under ID 1
     */
    var myTree = [
        { "Language": ["Python", "Perl", "Lisp", "Shell", "Haskell",
        "Markdown", "Latex", "Ruby"] },
        { "Tool": [ "Emacs", "Vim", "Linux"] },
        { "QA": [ "Quora", "StackOverflow", "ZhiHu", "SegmentFault" ] },
        { "Website": [ "BaiDu", "Github", "V2EX", "Jianshu" ]}
    ];

    myTree.forEach(function(f) {
        var fol;

        for (fol in f) {
            folderExistsOrCreate(fol);

            f[fol].forEach(function (e) {
                moveFolder2Folder(fol, e);
            });
        }
    });
}

function folderExistsOrCreate(folderName) {
    /*
    check if a folder exists.
    if not create that folder under ID 1.
     */
    var result = false;

    chrome.bookmarks.search(folderName, function (bookmarkArray) {
        var destId;

        for (var i = 0; i < bookmarkArray.length; ++i) {
            if (!bookmarkArray[i].url) {
                result = true;
            }
        }

        if (!result) {
            // does not exist, create the folder
            chrome.bookmarks.create({
                parentId: '1',
                index: 0,
                title: folderName
            }, function(bookmark) { });
            console.log("creating folder: " + folderName);
        }
    });

    return result;
}

function moveBookmarks2Folder(folderName, regStr) {
    /*
    move urls that matches regStr to folderName
     */

    chrome.bookmarks.search(folderName, function (bookmarkArray) {
        var destId;

        for (var i = 0; i < bookmarkArray.length; ++i) {
            if (!bookmarkArray[i].url) {
                destId = bookmarkArray[i].id;
            }
        }

        chrome.bookmarks.search(regStr, function (bookmarkArray) {
            for (var i = 0; i < bookmarkArray.length; ++i) {
                if (bookmarkArray[i].url && bookmarkArray[i].parentId == localStorage.MESSID) {
                    //console.log("parentId: " + bookmarkArray[i].parentId);

                    chrome.bookmarks.move(bookmarkArray[i].id, {
                        parentId: destId,
                        index: 0
                    }, function(bookmark) { });

                    console.log(folderName + " folder moving " + bookmarkArray[i].url);
                }
            }
        });
    });
}

function sleep(d){
    for(var t = Date.now();Date.now() - t <= d;);
}

function moveFolder2Folder(folderName1, folderName2) {
    /*
    folderName1 is destination.
    folderName2 is source folder.
    move folderName2 to folderName1
     */
    chrome.bookmarks.search(folderName1, function (bookmarkArray) {
        var destId;

        for (var i = 0; i < bookmarkArray.length; ++i) {
            if (!bookmarkArray[i].url) {
                destId = bookmarkArray[i].id;
            }
        }

        chrome.bookmarks.search(folderName2, function (bookmarkArray) {
            for (var i = 0; i < bookmarkArray.length; ++i) {
                if (!bookmarkArray[i].url) {
                    chrome.bookmarks.move(bookmarkArray[i].id, {
                        parentId: destId,
                        index: 0
                    }, function(bookmark) { });
                }
            }
        });
    });
}

function processArray(items, process) {
    var todo = items.concat();

    setTimeout(function() {
        process(todo.shift());
        if(todo.length > 0) {
            setTimeout(arguments.callee, 25);
        }
    }, 25);
}

//////////////////////////////////////////////////////////////////////////////////
////////////Following is some TEST functions. not that useful :-P/////////////////
//////////////////////////////////////////////////////////////////////////////////


function sortBookmarksInAll(id) {
    /*
     Folder `All` id is 1022
     Maybe this way does not work ... :-(
     */

    var sortedId = 0;

    chrome.bookmarks.getChildren(id, function(bookmarkArray){
        //console.log(bookmarkArray);
        bookmarkArray.sort(function (a, b) {
            return (a.url < b.url || a.title < b.title );
        });

        for (var i = 0; i < bookmarkArray.length; ++i) {
            //console.log(bookmarkArray[i].id + "- " + bookmarkArray[i].title +
            //bookmarkArray[i].url);
            chrome.bookmarks.move(bookmarkArray[i].id, {
                parentId: localStorage.MESSID,
                index: sortedId
            }, function(bookmark) {
            });
            sortedId++;
        }
    });
}

function removeAllOtherExceptAll() {
    //chrome.bookmarks.remove('1109', function(){
    //    console.log('Bookmark '
    //        + ' has been removed.');
    //});
}

function listMyBookmarks(el) {
    moveAllBookmarks2All();
    removeAllOtherExceptAll();


    chrome.bookmarks.getTree(function(bookmarkArray){
        //console.log(bookmarkArray);
        listBookmarkNodeReversely(el, bookmarkArray);
    });
}

function listBookmarkNodeReversely(el, bookmarkArray) {
    for (var i = 0; i < bookmarkArray.length; ++i) {
        //if (bookmarkArray[i].id != 1022 &&
        //    bookmarkArray[i].id != '0' &&
        //    bookmarkArray[i].id != '1') {
        //
        //}

        //if (bookmarkArray[i].url) {
        //    if (bookmarkArray[i].id != 1022 &&
        //    bookmarkArray[i].id != '0' &&
        //    bookmarkArray[i].id != '1') {
        //        chrome.bookmarks.move(bookmarkArray[i].id, {
        //            parentId: '1022',
        //            index: 0
        //        }, function(bookmark) {
        //            console.log(bookmark);
        //        });
        //    }
        //}

        //if (bookmarkArray[i].url) {
        //    var url = bookmarkArray[i].url;
        //    //console.log("[" + urlNum + "]: " + bookmarkArray[i].url);
        //    el.innerHTML += "<p>" + "[" + urlNum + "]: "
        //        + bookmarkArray[i].url + "</p>";
        //    dict[url]++;
        //    if (dict[url] > 1) {
        //        //el.innerHTML += dict[url];
        //        console.log(dict[url]);
        //    }
        //    urlNum++;
        //}
        chrome.bookmarks.getChildren(bookmarkArray[i].id, function(bookmarkArray) {
            if (bookmarkArray.length) {
                //console.log(bookmarkArray);
                listBookmarkNodeReversely(el, bookmarkArray);
            }
        })
    }
}
