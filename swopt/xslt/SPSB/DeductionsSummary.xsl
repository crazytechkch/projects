<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="detailByItem" use="Item" match="Detail"/>
	<xsl:template match="/">
		<html>
			<head>
				<style>
					body {font-family:sans-serif;font-size:10pt}
					thead {display:table-header-group;}
					tbody {display:table-row-group;}
					tfoot {display:table-footer-group;}
					table {border-collapse:collapse;}
					#datatable {width:100%}
					#datatable td{border:1px solid;border-style:none solid none solid}
					.orgnName {font-size:12pt;font-weight:bold}
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
				<tr><td colspan="100%" class="orgnName"><xsl:value-of select="Header/OrgnName"/></td></tr>
				<tr><td colspan="100%">
					<div>DEDUCTIONS SUMMARY</div>
					<div>FOR THE MONTH OF <xsl:value-of select="Header/ReportOptions/Date"/></div>
				</td></tr>
				<tr><td colspan="100%"><br/></td></tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="100%">
						<table id="datatable">
							<tr><td colspan="100%" style="border-style:none none solid none">ALLOWANCES</td></tr>
							<tr>
								<td style="border:1px solid"/>
								<xsl:for-each select="Header/Branches/Branch">
									<xsl:sort select="."/>
									<td style="border:1px solid" align="center"><xsl:value-of select="."/></td>
								</xsl:for-each>
								<td style="border:1px solid" align="center">Grand Total</td>
								<td style="border:1px solid" align="center">Previous Month</td>
							</tr>
							<tr>
								<td/>
								<xsl:for-each select="Header/Branches/Branch">
									<td align="center"><xsl:value-of select="//Header/ReportOptions/CurrencyCode"/></td>
								</xsl:for-each>
								<td align="center"><xsl:value-of select="Header/ReportOptions/CurrencyCode"/></td>
								<td align="center"><xsl:value-of select="Header/ReportOptions/CurrencyCode"/></td>
							</tr>
							<xsl:apply-templates select="key('detailByItem','Alimony')"/>
							<xsl:apply-templates select="key('detailByItem','Amanah Saham Bumiputra')"/>
							<xsl:apply-templates select="key('detailByItem','Angkasa Loan')"/>
							<xsl:apply-templates select="key('detailByItem','BSN Scheme')"/>
							<xsl:apply-templates select="key('detailByItem','Computer Loan - Interest')"/>
							<xsl:apply-templates select="key('detailByItem','Computer Loan - Principle')"/>
							<xsl:apply-templates select="key('detailByItem','Etiqa Insurance')"/>
							<xsl:apply-templates select="key('detailByItem','Half Pay Leave')"/>
							<xsl:apply-templates select="key('detailByItem','MCIS Zurich Insurance')"/>
							<xsl:apply-templates select="key('detailByItem','No Pay Leave')"/>
							<xsl:apply-templates select="key('detailByItem','Others')"/>
							<xsl:apply-templates select="key('detailByItem','Outstanding Debts - Yayasan Sabah')"/>
							<xsl:apply-templates select="key('detailByItem','Personal Loan Deduction - Public Bank')"/>
							<xsl:apply-templates select="key('detailByItem','Personal Loan Deduction - Sabah Credit')"/>
							<xsl:apply-templates select="key('detailByItem','Personal Loan Deduction - SCC2')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Advance Claims')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Basic Salary/Allowances')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Course/Seminar')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Heavy Equip Driver Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Housing Loan Subsidy')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Medical &amp; Ward Charges')"/>
							<xsl:apply-templates select="key('detailByItem','Recovery - Overtime')"/>
							<xsl:apply-templates select="key('detailByItem','SP KESURI Membership Fee')"/>
							<xsl:apply-templates select="key('detailByItem','Tabung Haji')"/>
							<xsl:apply-templates select="key('detailByItem','Toastmasters Fee')"/>
							<xsl:apply-templates select="key('detailByItem','Union Membership Fee')"/>
							<xsl:apply-templates select="key('detailByItem','Vehicle Loan - Interest')"/>
							<xsl:apply-templates select="key('detailByItem','Vehicle Loan - Principle')"/>
							<xsl:apply-templates select="key('detailByItem','YPEIM')"/>
							<xsl:apply-templates select="key('detailByItem','ZAKAT')"/>
							<xsl:apply-templates select="key('detailByItem','Zurich Insurance(MAA)')"/>
							<xsl:apply-templates select="key('detailByItem','GRAND TOTAL')"><xsl:with-param name="style">border:1px solid</xsl:with-param></xsl:apply-templates>
						</table>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr><td colspan="100%"><div style="height:50px"/></td></tr>
				<tr>
					<td width="24%" style="border:1px solid">
						<div style="height:70px">Prepared By :</div>
						<table>
							<tr><td>Position</td><td>:</td></tr>
							<tr><td>Date</td><td>:</td></tr>
						</table>
					</td>
					<td width="24%" style="border:1px solid">
						<div style="height:70px">Verified By :</div>
						<table>
							<tr><td>Position</td><td>:</td></tr>
							<tr><td>Date</td><td>:</td></tr>
						</table>
					</td>
					<td width="23%" style="border:1px solid">
						<div style="height:70px">Approved for Payment By :</div>
						<table>
							<tr><td>Position</td><td>:</td></tr>
							<tr><td>Date</td><td>:</td></tr>
						</table>
					</td>
					<td width="30%"><br/></td>
				</tr>
			</tfoot>
		</table>
	</xsl:template>
	<xsl:template match="Detail[@rptgroup='Deductions']">
		<xsl:param name="style"/>
		<tr>
			<!-- 
			 -->
			 <xsl:choose>
				<xsl:when test="Item='GRAND TOTAL'"><td style="border:1px solid">GRAND TOTAL</td></xsl:when>
				<xsl:otherwise><td><xsl:value-of select="Item"/></td></xsl:otherwise>
			</xsl:choose>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Headquarters'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Kota Kinabalu'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Kudat'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Kunak'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Lahad Datu'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Sandakan'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='SBCP'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='SBOT'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='Tawau'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='total'],'#,##0.00')"/></td>
			<td align="right"><xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute><xsl:value-of select="format-number(Amount[@branch='prev'],'#,##0.00')"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>