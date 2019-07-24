1. Some students are under the impression that you are building all possible paths to the destination square. Clarify that we are building only one PolyTreeNode for each square, and that the path upward to the root from each destination can be traced back to find the shortest path from the destination.
2. Remind them why we use `if __FILE__ == $PROGRAM_NAME`
3. Many students tried to write most of the logic in the `build_move_tree` method. Explain why it's better to abstract some of the logic into helper methods.