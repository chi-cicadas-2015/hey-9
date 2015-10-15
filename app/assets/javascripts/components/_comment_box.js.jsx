var CommentBox = React.createClass({
  // getInitialState: function() {
  //   return this.props.comments;
  // },

  // handleMessageSubmit: function ( formData, action ) {
  // var comment_form = this.props.comment_form;
  //   $.ajax({
  //     data: formData,
  //     url: action,
  //     type: "POST",
  //     dataType: "json",
  //     success: function ( data ) {
  //       this.setState({ comments: data, comment_form: comment_form });
  //     }.bind(this)
  //   });
  // },

  render: function () {
    return (
      <div className="comment-box">
        <CommentList comments={ this.props.comments } />
       {/* <CommentForm comment_form={ this.props.comment_form } /> */}

      </div>
    );
  }
});
