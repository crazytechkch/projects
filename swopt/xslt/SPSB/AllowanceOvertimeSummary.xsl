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
					<div>PAYROLL SUMMARY</div>
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
							<xsl:apply-templates select="key('detailByItem','Acting Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Charge Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Cost of Living Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Critical Service Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Dhoby Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Director Attendance Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Director Domestic Assistants Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Director Entertainment Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Director Fixed Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Director Household Utilities')"/>
							<xsl:apply-templates select="key('detailByItem','Director Housing Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Financial Duty Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Fire Fighting Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Heavy Equip. Driver Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Shift Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Special Allowance')"/>
							<xsl:apply-templates select="key('detailByItem','Total Allowance')"><xsl:with-param name="style">border:1px solid</xsl:with-param></xsl:apply-templates>
							<tr><td colspan="100%" style="border-style:solid none none none"><br/></td></tr>
							<tr><td colspan="100%" style="border-style:none none solid none">OVERTIME</td></tr>
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
							<xsl:apply-templates select="key('detailByItem','OT - Normal')"/>
							<xsl:apply-templates select="key('detailByItem','OT Meal for OT')"/>
							<xsl:apply-templates select="key('detailByItem','PH Work')"/>
							<xsl:apply-templates select="key('detailByItem','Rest Day Work')"/>
							<xsl:apply-templates select="key('detailByItem','Total OT')"><xsl:with-param name="style">border:1px solid</xsl:with-param></xsl:apply-templates>
							<tr><td colspan="100%" style="border-style:solid none none none"><br/></td></tr>
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
	<xsl:template match="Detail">
		<xsl:param name="style"/>
		<tr>
			<!-- 
			 -->
			 <xsl:choose>
				<xsl:when test="Item='Total Allowance' or Item='Total OT'"><td style="border:1px solid">GRAND TOTAL</td></xsl:when>
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