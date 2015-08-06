<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<style>
					body {font-family:sans-serif;font-size:10pt}
					thead {display:table-header-group;}
					tbody {display:table-row-group;}
					tfoot {display:table-footer-group;}
					table {border-collapse:collapse;}
					.orgnName {font-size:14pt;font-weight:bold;}
					.orgnGroup {font-size:11pt;font-weight:bold}
					.colheader td{border:1px;border-style:solid none solid none;padding:2px;}
					.datarow td{padding:2px;vertical-align:top}
					.summaryrow td{text-align:right}
					.gsttable td{font-size:8pt;padding:2px}
					.signtable td{padding:5px;border:1px solid black}
					.nametable {width:100%}
					.nametable td{border:none;padding:0px}
				</style>
			</head>
			<body>
				<xsl:apply-templates select="Documents/Document"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Document">
		<table style="width:100%">
			<thead id="header">
				<tr><td colspan="100%"><xsl:value-of select="Header/OrgnName"/></td></tr>
				<tr><td colspan="100%">
					<div>PAYROLL SUMMARY</div>
					<div>FOR THE MONTH OF <xsl:value-of select="Header/ReportOptions/Date"/></div>
				</td></tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<table>
							<tr>
								<td/>
								<td>Headquarters</td>
								<td>Kota Kinabalu</td>
								<td>Kudat</td>
								<td>Kunak</td>
								<td>Lahad Datu</td>
								<td>Sandakan</td>
								<td>Kudat</td>
								<td>SBCP</td>
								<td>SBOT</td>
								<td>Tawau</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>