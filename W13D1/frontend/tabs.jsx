import React from 'react';

class Headers extends React.Component {
  render() {
    const selected = this.props.selectedPane;
    const headers = this.props.panes.map((pane, index) => {
      const title = pane.title;
      const klass = index === selected ? 'active' : '';

      return (
        <li
          key={index}
          className={klass}
          onClick={() => this.props.onTabChosen(index)}>
          {title}{' '}
        </li>
      );
    });
    return (
      <ul className='tab-header'>
        {headers}
      </ul>

    );
  }
}

class Tabs extends React.Component {
    constructor(props){
        super(props);
        this.state = {
          selectedTabsIndex: 0
        }
        this.selectTab = this.selectTab.bind(this);
    }

    selectTab(num) {
        this.setState({selectedTabsIndex: num});
    }


    render() {
        const pane = this.props.panes[this.state.selectedTabsIndex];

        return(
            <div>
                <h1>Tabs</h1>
                <div className='tabs'>
                <Headers
                selectedTabsIndex={this.state.selectedTabsIndex}
                onTabChosen={this.selectTab}
                panes={this.props.panes}>
                </Headers>
                <div className='tab-content'>
                    <article>
                        {pane.content}
                    </article>
                </div>
                </div>
            </div>
        )
    }
}



export default Tabs;