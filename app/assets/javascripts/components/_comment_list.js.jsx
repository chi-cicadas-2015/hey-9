var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function(comment) {
        return <Comment commenter={ comment.commenter } content={ comment.content } />
    });

    return (
      <div className="comment-list">
        { commentNodes }
      </div>
    )
  }
});
