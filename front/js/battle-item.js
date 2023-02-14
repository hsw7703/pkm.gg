import module from "./module.js";

function createBattleItemDetail( ) {
    const indexDiv = document.querySelector( ".index" );
    const detailDiv = document.createElement( "div" );
    const titleDiv = document.createElement( "div" );
    const nameLabelP = document.createElement( "p" );
    const typeLabelP = document.createElement( "p" );
    const unlockDiv = document.createElement( "div" );
    const effectDiv = document.createElement( "div" );
    const lineDiv = document.createElement( "div" );

    detailDiv.className = "detail";
    detailDiv.classList.add( "hidden" );
    titleDiv.className = "title";
    nameLabelP.className = "name-label";
    typeLabelP.className = "type-label";
    unlockDiv.className = "unlock";
    effectDiv.className = "effect";
    lineDiv.className = "line";

    detailDiv.append( titleDiv, lineDiv, unlockDiv, effectDiv );
    titleDiv.append( nameLabelP, typeLabelP );
    indexDiv.append( detailDiv );

    const detailViewP = document.createElement( "p" );
    const detailViewA = document.createElement( "a" );

    detailViewP.className = "link";
    detailViewA.textContent = "자세히 보기 >";
    detailViewP.append( detailViewA );
    detailDiv.append( detailViewP );
}

function createBattleItemData( ) {

    const myStorage = localStorage;
    // const types = { "score":["스코어", "type"], "attack":["공격", "type"], "defense":["방어", "type"], "etc":["그외", "type"], "resetFilter":["초기화", "type"] };

    fetch( `https://pkm.gg/api/battle-items/?`, {
            "method": 'GET'
        , } )
        .then( ( response ) => (
            response.json( )
        ) )
        .then( ( data ) => {
            const info = JSON.stringify( data );

            myStorage.setItem( "battleItemInfo", info );
            module.createImg( data, createBattleItemDetail );
        } );
}

export {
    createBattleItemDetail
    , createBattleItemData
}
