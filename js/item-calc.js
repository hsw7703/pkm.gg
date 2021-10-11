function calculateCost() {
	const from = document.querySelector('#from');
	const to = document.querySelector('#to');
	const fromValue = from.options[from.selectedIndex].value;
	const toValue = to.options[to.selectedIndex].value;

	fetch(`https://pkm.gg/api/item-upgrade-cost/?start_level=${fromValue}&end_level=${toValue}`, {
		"method": 'GET',
	}).then((response) => (
		response.json()
	)).then((data) => {
		const costP = document.querySelector('.cost-calc > #cost');
		costP.textContent = `${data['cost']}개`;
	});
}