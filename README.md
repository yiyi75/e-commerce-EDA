## E-commerce Analytics: Funnel Optimization, BI & Behavioral Segmentation

This project provides end-to-end e-commerce analytics combining conversion funnel optimization (Python), strategic business intelligence (SQL), and behavioral customer segmentation (Python) using the Udemy e-commerce dataset containing 472,871 user sessions.

### **Dataset Overview**
The dataset represents a multi-year e-commerce business tracking:
- 472,871 user sessions across multiple traffic channels (paid search, organic, direct)
- 4 product lines with pricing, cost, and cross-sell data
- User journey data from landing page through purchase
- Time period: 3 years of operational data (2012-2015)

### **Tools & Technologies**
- Python: Pandas, Matplotlib, Seaborn, Scikit-learn (funnel visualization, cohort analysis, clustering)
- SQL: Complex queries with CTEs, window functions, conditional aggregation
- Data Processing: Session-level tracking, cohort segmentation, behavioral modeling

### **Analysis Components**:

**1. Customer Journey Funnel Analysis (Python)**
**Analytical Approach**:
- Stage-by-stage conversion funnel tracking from landing to order completion
- Monthly cohort analysis to identify behavioral trends over time
- Multi-dimensional visualizations (horizontal funnels, stream plots, KPI dashboards)

**Key Findings**:
- Cart stage represents the largest bottleneck with 63.7% drop-off rate
- Recent cohorts show 3.5% improvement in Cart View conversions
- Overall conversion rate: ~3% from initial session to completed order

**Business Impact**:
- Quantified high-priority areas for conversion optimization
- Established baseline metrics for A/B testing priorities
- Created reusable framework for ongoing funnel monitoring

**2. Strategic Business Intelligence (SQL)**
**Business Questions Answered**:
- **Growth Trajectory**: Session and order volume growth trended by quarter
- **Revenue Efficiency**: Revenue per session increased 2x (from $1.50 to $5.30)
- **Channel Performance**: Analyzed 5 traffic channels showing shift from paid dependency to organic/direct
- **Product Analytics**: Identified seasonality patterns across 4 product lines
- **Cross-sell Analysis**: Product 4 shows significantly higher cross-sell rates across all primary products

**Key SQL Techniques Used**:
- CTEs for complex multi-stage queries
- Conditional aggregation with CASE statements
- Multi-table joins across sessions, orders, and product data
- Cohort and time-series analysis

**3. Customer Segmentation: Behavioral Clustering (Python)**
**Analytical Approach**:
- Behavioral feature engineering: order frequency, revenue, session activity, product diversity, tenure
- Unsupervised clustering using K-Means (K=3) validated with Silhouette Score (0.60)
- Alternative to churn prediction (not viable due to 99.8% churn rate, 98.1% one-time buyers)

**Key Segments Identified**:
1. **Low-Value One-Time Buyers**: High volume, low AOV, minimal engagement
2. **High-AOV One-Time Buyers**: Premium purchasers with high average order value
3. **Loyal High-Value Customers**: Small but critical segment driving repeat revenue

**Business Impact**:
- Provides actionable customer taxonomy for targeted marketing
- Enables differentiated retention strategies by segment
- Creates production-ready model for assigning new customers to behavioral groups

### **Analytical Methodology**
**Conversion Funnel (Python)**:
- Data cleaning and session-level funnel construction
- Cohort segmentation by user acquisition month
- Multi-perspective visualization and statistical analysis

**Business Intelligence (SQL)**:
- Growth metrics: volume trends and efficiency ratios
- Channel attribution: traffic source performance and conversion
- Product analytics: revenue, margin, seasonality patterns

**Customer Segmentation (Python)**:
- Behavioral feature engineering and normalization
- Unsupervised clustering with quality validation
- Segment profiling and business interpretation
- PCA visualization of cluster separation

### **Key Insights & Recommendations**
**Immediate Optimization Priorities**:
- Cart abandonment: 63.7% drop-off requires urgent UX improvements
- Product 4 expansion: High cross-sell performance suggests opportunity for similar product additions
- Segment-specific strategies: Differentiate marketing for High-AOV vs. Loyal customers

**Strategic Opportunities**:
- Recent cohorts showing 3.5% conversion improvement validates product/UX changes
- Behavioral segments provide foundation for personalized customer journeys
- Product page CTR gains (71% -> 86%) demonstrate value of multi-product strategy
- Segmentation model enables scalable customer lifecycle management
