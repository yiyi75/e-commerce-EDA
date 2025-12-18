## E-commerce Analytics: Customer Journey & Business Intelligence
This project provides end-to-end e-commerce analytics combining conversion funnel optimization (Python) and strategic business intelligence (SQL) using the Udemy e-commerce dataset containing 472,871 user sessions. 

### **Dataset Overview**
The dataset represents a multi-year e-commerce business tracking:
- 472,871 user sessions across multiple traffic channels (paid search, organic, direct)
- 4 product lines with pricing, cost, and cross-sell data
- User journey data from landing page through purchase
- Time period: 3 years of operational data (2012-2015)

### **Tools & Technologies**
- Python: Pandas, Matplotlib, Seaborn (funnel visualization and cohort analysis)
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
- Identified specific drop-off points requiring UX intervention
**Business Impact**:
- Quantified high-priority areas for conversion optimization
- Established baseline metrics for A/B testing priorities
- Created reusable framework for ongoing funnel monitoring

<img width="4193" height="3128" alt="ecommerce_funnel_dashboard" src="https://github.com/user-attachments/assets/c2a7cf9a-c283-4f27-ab7b-1e65ba983566" />

**2. Strategic Business Intelligence (SQL)**

**Business Questions Answered**:
1. **Growth Trajectory**
- Session and order volume growth trended by quarter
- Session-to-order conversion improved by 5 percentage points since launch
2. **Revenue Efficiency**
- Revenue per session increased 2x (from $1.50 to $5.30)
- Revenue per order growth tracked across all quarters
3. **Channel Performance**
- Analyzed 5 traffic channels: paid nonbrand (gsearch, bsearch), brand search, organic, and direct
- Found business shifting from paid dependency to organic/direct (better margins)
- Tracked channel-specific conversion rates showing organic and direct outperforming paid channels
4. **Product Analytics**
- Identified seasonality patterns: Product 1 peaks in Nov/Dec (holiday), Product 2 in Feb (Valentine's)
- Monthly revenue and margin tracking across 4 product lines
5. **Product Page Optimization**
- Click-through rate from /products page improved from 71.3% to 85.6%
- Product-to-order conversion increased 72% over analysis period
6. **Cross-sell Analysis**
- Product 4 (launched Dec 2014) shows significantly higher cross-sell rates across all primary products
- Cross-sell strategy validation: Product 4 addition measurably increased order value

**Key SQL Techniques Used**:
- CTEs for complex multi-stage queries
- Conditional aggregation with CASE statements
- Multi-table joins across sessions, orders, and product data
- Cohort and time-series analysis
- Channel attribution logic

### **Analytical Methodology**
**Conversion Funnel (Python):**
- Data cleaning and session-level funnel construction
- Cohort segmentation by user acquisition month
- Multi-perspective visualization (horizontal bars, stream plots, dashboards)
- Statistical analysis of drop-off rates and conversion metrics

**Business Intelligence (SQL):**
- Growth metrics: volume trends and efficiency ratios
- Channel attribution: traffic source performance and conversion
- Product analytics: revenue, margin, seasonality patterns
- Behavioral analysis: page flow, cross-sell effectiveness

### **Key Insights & Recommendations**
Immediate Optimization Priorities:
- Cart abandonment: 63.7% drop-off requires urgent UX improvements (payment friction, shipping transparency, trust signals)
- Product 4 expansion: High cross-sell performance suggests opportunity for similar product additions
- Channel strategy: Continue investing in brand/organic (better margins) while optimizing paid efficiency

Strategic Opportunities:
- Recent cohorts showing 3.5% conversion improvement validates product/UX changes
- Seasonal patterns identified can inform inventory and marketing timing
- Product page CTR gains (71% -> 86%) demonstrate value of multi-product strategy
