window.chartColors = {
	red: 'rgb(255, 99, 132, 0.01)',
	orange: 'rgb(255, 159, 64, 0.01)',
	yellow: 'rgb(255, 205, 86, 0.01)',
	green: 'rgb(75, 192, 192, 0.01)',
	blue: 'rgb(54, 162, 235, 0.01)',
	purple: 'rgb(153, 102, 255, 0.01)',
	grey: 'rgb(231,233,237, 0.01)'
};

window.randomScalingFactor = function() {
	return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
}
