maxLoopbackScore = 0;
maxNetworkScore  = 0;
platform = new Array(0);

function initialize(platformCount, loopbackCount, networkCount) {
	platform = new Array(platformCount);
	for (i = 0; i < platform.length; i++) {
		platform[i] = new Array(8);

		platform[i].name      = "";
		platform[i].style     = "";
		platform[i].score     = 0;
		platform[i].loop      = new Array(loopbackCount);
		platform[i].net       = new Array(networkCount);
		platform[i].error     = "";
		platform[i].showname  = true;
		platform[i].showerror = true;

		for (j = 0; j < platform[i].loop.length; j++)
			platform[i].loop[j] = 0;
		for (j = 0; j < platform[i].net.length; j++)
			platform[i].net[j] = 0;
	}
}

function calculateScores() {
	for (i = 0; i < platform.length; i++) {
		sum = 0;
		for (j = 1; j < platform[i].loop.length; j++)
			sum += platform[i].loop[j];
		platform[i].score = Math.round(sum / (platform[i].loop.length - 1));
	}

	for (i = 0; i < platform.length; i++) {
		maxLoopbackScore = Math.max(maxLoopbackScore, platform[i].score);
		for (j = 0; j < platform[i].net.length; j++)
			maxNetworkScore = Math.max(maxNetworkScore, platform[i].net[j]);
	}
}

function getLoopbackRow(i) {
	row = '<tr>\n';
	row += '<td nowrap align="right">' + platform[i].name + '</td>\n';
	row += '<td>&nbsp;</td>\n';
	if (platform[i].score > 0)
		row += '<td><table width="' + Math.round(100 * platform[i].score / maxLoopbackScore) + '%"><tr><td class="' + platform[i].style + '">&nbsp;</td></tr></table></td>\n';
	else
		row += '<td><table><tr><td nowrap><span class="error">' + platform[i].error + '</span></td></tr></table></td>\n';
	row += '<td align="right">' + platform[i].score + '</td>\n';
	row += '</tr>';
	return row;
}

function getNetworkRow(i, j) {
	row = '<tr>\n';
	if (platform[i].showname) {
		row += '<td nowrap align="right">' + platform[i].name + '</td>\n';
		platform[i].showname = false;
	}
	else
		row += '<td>&nbsp;</td>\n';
	row += '<td>&nbsp;</td>\n';
	if (platform[i].net[j] > 0)
		row += '<td><table width="' + Math.round(100 * platform[i].net[j] / maxNetworkScore) + '%"><tr><td class="' + platform[i].style + '">' + (1000 * (j + 1)) + '</td></tr></table></td>\n';
	else if (platform[i].showerror) {
		row += '<td><table><tr><td nowrap>' + (1000 * (j + 1)) + '<span class="error"> - ' + platform[i].error + '</span></td></tr></table></td>\n';
		platform[i].showerror = false;
	}
	else
		row += '<td><table><tr><td>' + (1000 * (j + 1)) + '</td></tr></table></td>\n';
	row += '<td align="right">' + platform[i].net[j] + '</td>\n';
	row += '</tr>';
	return row;
}

function writeTableHeader(i) {
	document.writeln('<table id="table' + i + '" cellspacing="0" cellpadding="0" border="0" width="100%">');
	document.writeln('<tr><td colspan="4"><hr noshade size="1"></td></tr>');
	document.writeln('<tr>');
	document.writeln('<th nowrap align="right">Java Platform</th>');
	document.writeln('<th>&nbsp;</th>');
	document.writeln('<th width="90%">Score</th>');
	document.writeln('<th>&nbsp;</th>');
	document.writeln('</tr>');
	document.writeln('<tr><td colspan="4"><hr noshade size="1"></td></tr>');
}

function writeTableFooter() {
	document.writeln('<tr><td colspan="4"><hr noshade size="1"></td></tr>');
	document.writeln('</table>');
}

function writeLoopbackTable() {
	writeTableHeader(1);
	for (i = 0; i < platform.length; i++)
		document.writeln(getLoopbackRow(i));
	writeTableFooter();
}

function writeNetworkTable() {
	writeTableHeader(2);
	for (i = 0; i < platform.length; i++) {
		if (i > 0 && i < platform.length)
			document.writeln('<tr><td colspan="4">&nbsp;</td></tr>');
		for (j = 0; j < platform[i].net.length; j++)
			document.writeln(getNetworkRow(i, j));
	}
	writeTableFooter();
}
