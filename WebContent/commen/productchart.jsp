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
	//数据库连接

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
	StandardChartTheme standardChartTheme = new StandardChartTheme("CN"); //创建主题样式
	standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20)); //设置标题字体
	standardChartTheme.setRegularFont(new Font("微软雅黑", Font.PLAIN, 15)); //设置图例的字体
	standardChartTheme.setLargeFont(new Font("微软雅黑", Font.PLAIN, 15)); //设置轴向的字体
	ChartFactory.setChartTheme(standardChartTheme); //设置主题样式
	DefaultCategoryDataset dataset1 = new DefaultCategoryDataset();
	while(set.next()){
		String category = set.getString("category");
		int count = set.getInt("count(*)");
		dataset1.addValue(count, "自行车类型数量", category);
	}
	
	//创建JFreeChart组件的图表对象
	JFreeChart chart = ChartFactory.createBarChart3D("自行车图表", //图表标题
			"类型", //x轴的显示标题
			"数量", //y轴的显示标题
			dataset1, //数据集
			PlotOrientation.VERTICAL, //图表方向(垂直)
			true, //是否包含图例
			false, //是否包含提示
			false //是否包含URL
	);
	//设置图表的文件名
	// 固定用法
	ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	String fileName = ServletUtilities.saveChartAsPNG(chart, 500, 280, info, session);
	String url = request.getContextPath() + "/servlet/DisplayChart?filename=" + fileName;
%>
<html>

<head>
<title>绘制柱形图</title>
</head>

<body topmargin="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>&nbsp;<img src="<%=url%>"></td>
		</tr>
	</table>
</body>

</html>
