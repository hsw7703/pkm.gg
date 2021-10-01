import module from "./module.js";

function createItemDetail() {
    const indexDiv = document.querySelector(".index");
    const detailDiv = document.createElement("div");
    const titleDiv = document.createElement("div");
    const nameLabelP = document.createElement("p");
    const typeLabelP = document.createElement("p");
    const effectDiv = document.createElement("div");
    const lineDiv = document.createElement("div");
    const levelTable = document.createElement("table");
    const tHead = document.createElement("thead");
    const tBody = document.createElement("tbody");
    const tableHeadRow = document.createElement("tr");
    const leftTableHead = document.createElement("th");
    const rightTableHead = document.createElement("th");
    
    detailDiv.className = "detail";
    detailDiv.classList.add("hidden");
    titleDiv.className = "title";
    nameLabelP.className = "name-label";
    typeLabelP.className = "type-label";
    effectDiv.className = "effect";
    levelTable.className = "spec-table";
    lineDiv.className = "line";
    
    for (let i=0;i<4;i++){
        const tableRow = document.createElement("tr");
        const leftTableData = document.createElement("td");
        const rightTableData = document.createElement("td");
        
        tBody.append(tableRow);
        tableRow.append(leftTableData, rightTableData);
    }
    
    detailDiv.append(titleDiv, lineDiv, effectDiv, levelTable);
    titleDiv.append(nameLabelP,typeLabelP);
    levelTable.append(tHead, tBody);
    tHead.append(tableHeadRow);
    tableHeadRow.append(leftTableHead,rightTableHead);
    indexDiv.append(detailDiv);

    const detailViewP = document.createElement("p");
    const detailViewA = document.createElement("a");

    detailViewP.className = "link";
    detailViewA.textContent = "자세히 보기 >";
    detailViewP.append(detailViewA);
    detailDiv.append(detailViewP);
}

function createItemData() {

    const myStorage = localStorage;
    const types = { "score":["스코어", "type"], "attack":["공격", "type"], "defense":["방어", "type"], "etc":["그외", "type"], "resetFilter":["초기화", "type"] };

    fetch(`https://pkm.gg/api/item/?`, {
        "method": 'GET',
    }).then((response) => (
        response.json()
    )).then((data) => {
        const info = JSON.stringify(data);
        
        myStorage.setItem("itemInfo", info);
        module.createImg(data, createItemDetail);
    });
}

export {
    createItemDetail,
    createItemData
}
