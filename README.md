## E-commerce Analytics: Funnel Optimization, BI & Behavioral Segmentation

This project delivers end-to-end e-commerce analytics, combining conversion funnel optimization, strategic business intelligence, behavioral customer segmentation, and a personalized recommendation system using the Udemy e-commerce dataset of 472,871 user sessions.

### **Dataset Overview**
The dataset represents a multi-year e-commerce business tracking:
- 472,871 user sessions across multiple traffic channels (paid search, organic, direct)
- 4 product lines with pricing, cost, and cross-sell data
- User journey data from landing page through purchase
- Time period: 3 years of operational data (2012-2015)

### **Tools & Technologies**
- Python: Pandas, Matplotlib, Seaborn, Scikit-learn, Mlxtend
- SQL: Complex queries with CTEs, window functions, conditional aggregation
- Data Processing: Session-level tracking, cohort segmentation, behavioral modeling
- Machine Learning: K-Means clustering, Association Rule Mining, Collaborative Filtering

### **Analysis Components**:

**1. Customer Journey Funnel Analysis (Python)**
**Analytical Approach**:
- Stage-by-stage conversion funnel tracking from landing to order completion
- Monthly cohort analysis to identify behavioral trends over time
- Multi-dimensional visualizations (horizontal funnels, stream plots, KPI dashboards)
<img width="4193" height="3128" alt="ecommerce_funnel_dashboard" src="https://github.com/user-attachments/assets/eb65f7f5-2b7b-43e3-91da-9fa1b8a54f2e" />

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
1. **Low-Value One-Time Buyers** (72%): High volume, low AOV, minimal engagement
2. **High-AOV One-Time Buyers** (22%): Premium purchasers with high average order value
3. **Loyal High-Value Customers** (2%): Small but critical segment driving repeat revenue

**Business Impact**:
- Provides actionable customer taxonomy for targeted marketing
- Enables differentiated retention strategies by segment
- Creates production-ready model for assigning new customers to behavioral groups

**4. Personalized Recommendation System (Python)**
**Analytical Approach**:
- Market basket analysis using association rule mining per customer segment
- Multi-strategy engine combining popularity-based, price-tier, and bundle recommendations
- Segment-specific tactics tailored to each customer group's behavior and value

**Key Findings & Performance**:
- **Loyal High-Value Customers**: 92% potential AOV increase (from $50 to $96 on average)
- **High-AOV One-Time Buyers**: 27.3% potential AOV increase (from $110 to $140 on average)
- **Estimated Monthly Revenue Potential**: $24,828 across all segments
- **Critical Insight**: 98.1% one-time buyers make basket size optimization essential for revenue growth

**Recommendation Strategies**:
- **Low-Value Segment**: Shipping threshold nudges and value-focused bundles
- **High-AOV Segment**: Premium accessories and limited edition upsells
- **Loyal Segment**: Personalized recommendations and exclusive offerings

**Implementation Ready**:
- Exportable models for production deployment
- Flask API endpoint for real-time recommendations
- A/B testing framework for continuous optimization

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

**Recommendation System (Python)**:
- Market basket analysis using association rules
- Collaborative filtering with product similarity matrices
- Segment-specific budget optimization algorithms
- Performance validation through holdout testing
<img width="1790" height="616" alt="1" src="https://github.com/user-attachments/assets/4135d372-425a-461b-bc3f-544709c1e256" />

### **Key Insights & Recommendations**
**Immediate Optimization Priorities**:
- Cart abandonment: 63.7% drop-off requires urgent UX improvements
- Product 4 expansion: High cross-sell performance suggests opportunity for similar product additions
- Segment-specific strategies: Differentiate marketing for High-AOV vs. Loyal vs. Low-Value customers
- Recommendation deployment: Start with High-AOV segment (proven 27.3% uplift), then optimize for Low-Value segment

**Business Impact Analysis**:
- **High-AOV Segment**: $22,110 monthly revenue potential (89% of total opportunity)
- **Loyal Segment**: $2,718 monthly potential with 92% per-customer increase
- **Low-Value Segment**: Critical volume opportunity - 23,741 customers requiring strategy optimization
- **Total Addressable Opportunity**: $24,828 monthly with current system

**Strategic Opportunities**:
- Recent cohorts showing 3.5% conversion improvement validates product/UX changes
- Behavioral segments provide foundation for personalized customer journeys
- Product page CTR gains (71% -> 86%) demonstrate value of multi-product strategy
- Recommendation system enables direct revenue impact through basket size optimization

**Implementation Roadmap**:
1. **Week 1-2**: Deploy recommendations for High-AOV segment (quick revenue impact)
2. **Week 3-4**: Optimize strategy for Low-Value segment (volume optimization)
3. **Month 2**: Enhance Loyal segment personalization (LTV maximization)
4. **Ongoing**: A/B testing and continuous optimization across all segments
