<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="org.jfree.chart.ChartRenderingInfo"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page import="org.jfree.chart.StandardChartTheme"%>
<%@ page import="java.awt.Font"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.sql.DataSource"%>

<%
	//���ݿ�����

	boolean res = false;
	ResultSet set;
	Context ctx = new InitialContext();
	ctx = (Context) ctx.lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("TestJNDI");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "select category,count(*) from products group by products.category order by products.category";
	PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
	set = ps.executeQuery();
	StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); //����������ʽ
	standardChartTheme.setExtraLargeFont(new Font("����", Font.BOLD, 20)); //���ñ�������
	standardChartTheme.setRegularFont(new Font("΢���ź�", Font.PLAIN, 15)); //����ͼ��������
	standardChartTheme.setLargeFont(new Font("΢���ź�", Font.PLAIN, 15)); //�������������
	ChartFactory.setChartTheme(standardChartTheme); //����������ʽ
	DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();
	while(set.next()){
		String category = set.getString("category");
		int count = set.getInt("count(*)");
		dataset1.addValue(count, "���г���������", category);
	}
	
	//����JFreeChart�����ͼ�����
	JFreeChart chart = ChartFactory.createBarChart3D("���г�ͼ��", //ͼ�����
			"����", //x�����ʾ����
			"����", //y�����ʾ����
			dataset1, //���ݼ�
			PlotOrientation.VERTICAL, //ͼ����(��ֱ)
			true, //�Ƿ����ͼ��
			false, //�Ƿ������ʾ
			false //�Ƿ����URL
	);
	//����ͼ����ļ���
	// �̶��÷�
	ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	String fileName = ServletUtilities.saveChartAsPNG(chart, 500, 280, info, session);
	String url = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName;
%>
<html>

<head>
<title>��������ͼ</title>
</head>

<body topmargin="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>&nbsp;<img src="<%=url%>"></td>
		</tr>
	</table>
</body>

</html>
