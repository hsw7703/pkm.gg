import module from "./module.js";

function createItemDetail() {
    const indexDiv = document.querySelector(".index");
    const detailDiv = document.createElement("div");
    const titleDiv = document.createElement("div");
    const nameLabelP = document.createElement("p");
    const typeLabelP = document.createElement("p");
    const contentDiv = document.createElement("div");
    const effectDiv = document.createElement("div");
    const lineDiv = document.createElement("div");
    const descriptionDiv = document.createElement("p");
    const levelTable = document.createElement("table");
    const tableHeadRow = document.createElement("tr");
    const leftTableHead = document.createElement("th");
    const rightTableHead = document.createElement("th");
    
    detailDiv.className = "detail";
    detailDiv.classList.add("hidden");
    titleDiv.className = "title";
    nameLabelP.className = "name-label";
    typeLabelP.className = "type-label";
    contentDiv.className = "content";
    effectDiv.className = "effect";
    levelTable.className = "spec-table";
    leftTableHead.className = "left";
    rightTableHead.className = "right";
    lineDiv.className = "line";
    
    for (let i=0;i<4;i++){
        const tableRow = document.createElement("tr");
        const leftTableData = document.createElement("td");
        const rightTableData = document.createElement("td");
        
        levelTable.append(tableRow);
        tableRow.append(leftTableData, rightTableData);
        
        leftTableData.className = "left";
        rightTableData.className = "right";
    }
    
    
    detailDiv.append(contentDiv);
    contentDiv.append(titleDiv, lineDiv, effectDiv, levelTable);
    titleDiv.append(nameLabelP,typeLabelP);
    effectDiv.append(descriptionDiv, levelTable);
    levelTable.append(tableHeadRow);
    tableHeadRow.append(leftTableHead,rightTableHead);
    indexDiv.append(detailDiv);
}

function createItemData() {

    const myStorage = localStorage;
    const types = { "score":"스코어", "attack":"공격", "defense":"방어", "etc":"그외", "resetFilter":"초기화" };

    fetch(`https://pkm.gg/api/item/?`, {
        "method": 'GET',
    }).then((response) => (
        response.json()
    )).then((data) => {
        const info = JSON.stringify(data);
        myStorage.setItem("itemInfo", info);
        module.createImg(data, createItemDetail);
        module.filterTagCreate(types);
    });
}

export {
    createItemDetail,
    createItemData
}
